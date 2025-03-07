#!/bin/bash
# ARTWORK
# GET=1 (attempt to fetch Postgres database and Grafana database from the test server)
# AGET=1 (attempt to fetch 'All CNCF' Postgres database from the test server)
# INIT=1 (needs PG_PASS_RO, PG_PASS_TEAM, initialize from no postgres database state, creates postgres logs database and users)
# SKIPWWW=1 (skips Apache and SSL cert configuration, final result will be Grafana exposed on the server on its port (for example 3010) via HTTP)
# SKIPVARS=1 (if set it will skip final Postgres vars regeneration)
# CUSTGRAFPATH=1 (set this to use non-standard grafana instalation from ~/grafana.v5/)
# SETPASS=1 (should be set on a real first run to set main postgres password interactively, CANNOT be used without user interaction)
set -o pipefail
exec > >(tee run.log)
exec 2> >(tee errors.txt)
if [ -z "$PG_PASS" ]
then
  echo "$0: You need to set PG_PASS environment variable to run this script"
  exit 1
fi
if ( [ ! -z "$INIT" ] && ( [ -z "$PG_PASS_RO" ] || [ -z "$PG_PASS_TEAM" ] ) )
then
  echo "$0: You need to set PG_PASS_RO, PG_PASS_TEAM when using INIT"
  exit 1
fi

if [ ! -z "$CUSTGRAFPATH" ]
then
  GRAF_USRSHARE="$HOME/grafana.v5/usr.share.grafana"
  GRAF_VARLIB="$HOME/grafana.v5/var.lib.grafana"
  GRAF_ETC="$HOME/grafana.v5/etc.grafana"
fi

if [ -z "$GRAF_USRSHARE" ]
then
  GRAF_USRSHARE="/usr/share/grafana"
fi
if [ -z "$GRAF_VARLIB" ]
then
  GRAF_VARLIB="/var/lib/grafana"
fi
if [ -z "$GRAF_ETC" ]
then
  GRAF_ETC="/etc/grafana"
fi
export GRAF_USRSHARE
export GRAF_VARLIB
export GRAF_ETC

export ADD_ALLCDF=1
export PROD_SERVER=1
export GHA2DB_PROJECTS_YAML="cdf/projects.yaml"
export LIST_FN_PREFIX="cdf/all_"
if [ ! -z "$ONLY" ]
then
  export ONLY
fi

host=`hostname`
function finish {
    sync_unlock.sh
    rm -f /tmp/deploy.wip 2>/dev/null
}
if [ -z "$TRAP" ]
then
  sync_lock.sh || exit -1
  trap finish EXIT
  export TRAP=1
  > /tmp/deploy.wip
fi

. ./devel/all_projs.sh || exit 2

if [ -z "$ONLYDB" ]
then
  alldb=`cat ./cdf/all_prod_dbs.txt`
else
  alldb=$ONLYDB
fi

LASTDB=""
for db in $alldb
do
  exists=`./devel/db.sh psql postgres -tAc "select 1 from pg_database where datname = '$db'"` || exit 100
  if [ ! "$exists" = "1" ]
  then
    LASTDB=$db
  fi
done
export LASTDB
echo "Last missing DB is $LASTDB"

if [ ! -z "$INIT" ]
then
  ./devel/init_database.sh || exit 1
fi

# OCI has no icon in cncf/artwork at all, so use "-" here
# Use GA="-" to skip GA (google analytics) code
# Use ICON="-" to skip project ICON
for proj in $all
do
  db=$proj
  if [ "$proj" = "spinnaker" ]
  then
    PROJ=spinnaker           PROJDB=spinnaker      PROJREPO="spinnaker/spinnaker"             ORGNAME=Spinnaker         PORT=3102 ICON=spinnaker      GRAFSUFF=spinnaker      GA="-" ./devel/deploy_proj.sh || exit 35
  elif [ "$proj" = "tekton" ]
  then
    PROJ=tekton              PROJDB=tekton         PROJREPO="tektoncd/pipeline"               ORGNAME=Tekton            PORT=3104 ICON=tekton         GRAFSUFF=tekton         GA="-" ./devel/deploy_proj.sh || exit 42
  elif [ "$proj" = "jenkins" ]
  then
    PROJ=jenkins             PROJDB=jenkins        PROJREPO="jenkinsci/jenkins"               ORGNAME=Jenkins           PORT=3105 ICON=jenkins        GRAFSUFF=jenkins        GA="-" ./devel/deploy_proj.sh || exit 43
  elif [ "$proj" = "jenkinsx" ]
  then
    PROJ=jenkinsx            PROJDB=jenkinsx       PROJREPO="jenkins-x/jx"                    ORGNAME='Jenkins X'       PORT=3106 ICON=jenkinsx       GRAFSUFF=jenkinsx       GA="-" ./devel/deploy_proj.sh || exit 44
  elif [ "$proj" = "cdevents" ]
  then
    PROJ=cdevents            PROJDB=cdevents       PROJREPO="cdevents/spec"                   ORGNAME=CDEvents          PORT=3107 ICON=cdevents       GRAFSUFF=cdevents       GA="" ./devel/deploy_proj.sh || exit 45
  elif [ "$proj" = "ortelius" ]
  then
    PROJ=ortelius            PROJDB=ortelius       PROJREPO="ortelius/ortelius"               ORGNAME=Ortelius          PORT=3108 ICON=ortelius       GRAFSUFF=ortelius       GA="" ./devel/deploy_proj.sh || exit 46
  elif [ "$proj" = "pyrsia" ]
  then
    PROJ=pyrsia              PROJDB=pyrsia         PROJREPO="pyrsia/pyrsia"                   ORGNAME=Pyrsia            PORT=3109 ICON=pyrsia         GRAFSUFF=pyrsia         GA="" ./devel/deploy_proj.sh || exit 47
  elif [ "$proj" = "screwdrivercd" ]
  then
    PROJ=screwdrivercd       PROJDB=screwdrivercd  PROJREPO="screwdriver-cd/screwdriver"      ORGNAME='Screwdriver CD'  PORT=3110 ICON=screwdrivercd  GRAFSUFF=screwdrivercd  GA="" ./devel/deploy_proj.sh || exit 48
  elif [ "$proj" = "shipwright" ]
  then
    PROJ=shipwright          PROJDB=shipwright     PROJREPO="shipwright-io/build"             ORGNAME=Shipwright        PORT=3111 ICON=shipwright     GRAFSUFF=shipwright     GA="" ./devel/deploy_proj.sh || exit 49
  elif [ "$proj" = "allcdf" ]
  then
    PROJ=allcdf              PROJDB=allcdf         PROJREPO="not/used"                        ORGNAME="All CDF"         PORT=3255 ICON=cdf            GRAFSUFF=allcdf         GA="-" ./devel/deploy_proj.sh || exit 45
  else
    echo "Unknown project: $proj"
    exit 28
  fi
done

if [ -z "$SKIPWWW" ]
then
  CERT=1 WWW=1 ./devel/create_www.sh || exit 37
fi
if [ -z "$SKIPVARS" ]
then
  ./devel/vars_all.sh || exit 38
fi
echo "$0: All deployments finished"
