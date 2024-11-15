-- generated by github.com/kubernetes/community/hack/generate-devstats-repo-sql.py

-- clean repo groups first
update
  gha_repos
set
  repo_group = null
;

-- Add repository groups

update gha_repos set repo_group = 'Kubernetes' where lower(name) in (
  'googlecloudplatform/kubernetes',
  'kubernetes',
  'kubernetes/',
  'kubernetes/kubernetes'
);

update gha_repos set repo_group = 'SIG API Machinery' where lower(name) in (
  'kubernetes-client/c',
  'kubernetes-client/client-python',
  'kubernetes-client/community',
  'kubernetes-client/csharp',
  'kubernetes-client/gen',
  'kubernetes-client/go',
  'kubernetes-client/go-base',
  'kubernetes-client/haskell',
  'kubernetes-client/java',
  'kubernetes-client/javascript',
  'kubernetes-client/perl',
  'kubernetes-client/python',
  'kubernetes-client/python-base',
  'kubernetes-client/ruby',
  'kubernetes-client/typescript',
  'kubernetes-incubator/apiserver-builder',
  'kubernetes-incubator/apiserver-builder-alpha',
  'kubernetes-incubator/client-python',
  'kubernetes-retired/typescript',
  'kubernetes-sigs/apiserver-builder-alpha',
  'kubernetes-sigs/apiserver-runtime',
  'kubernetes-sigs/clientgofix',
  'kubernetes-sigs/controller-runtime',
  'kubernetes-sigs/controller-tools',
  'kubernetes-sigs/kube-metacontroller',
  'kubernetes-sigs/kube-storage-version-migrator',
  'kubernetes-sigs/kubebuilder',
  'kubernetes-sigs/kubebuilder-declarative-pattern',
  'kubernetes-sigs/kubebuilder-release-tools',
  'kubernetes-sigs/legacyflag',
  'kubernetes-sigs/meta-controller',
  'kubernetes-sigs/structured-merge-diff',
  'kubernetes-sigs/yaml',
  'kubernetes/apiextensions-apiserver',
  'kubernetes/apimachinery',
  'kubernetes/apiserver',
  'kubernetes/client-go',
  'kubernetes/code-generator',
  'kubernetes/component-base',
  'kubernetes/controller-manager',
  'kubernetes/gengo',
  'kubernetes/kube-aggregator',
  'kubernetes/kube-openapi',
  'kubernetes/sample-apiserver',
  'kubernetes/sample-controller'
);

update gha_repos set repo_group = 'SIG Apps' where lower(name) in (
  'kubernetes-incubator/application-images',
  'kubernetes-incubator/kompose',
  'kubernetes-retired/application-images',
  'kubernetes-sigs/app',
  'kubernetes-sigs/application',
  'kubernetes-sigs/apps_application',
  'kubernetes-sigs/execution-hook',
  'kubernetes/application-dm-templates',
  'kubernetes/application-images',
  'kubernetes/examples',
  'kubernetes/kompose'
);

update gha_repos set repo_group = 'SIG Architecture' where lower(name) in (
  'kubernetes/api',
  'kubernetes/component-helpers',
  'kubernetes/contrib',
  'kubernetes/features',
  'kubernetes/enhancements',
  'kubernetes/utils'
);

update gha_repos set repo_group = 'SIG Auth' where lower(name) in (
  'kubernetes-sigs/multi-tenancy',
  'kubernetes-sigs/seccomp-operator',
  'kubernetes-sigs/secrets-store-csi-driver',
  'kubernetes-sigs/wg-policy-prototypes'
);

update gha_repos set repo_group = 'SIG Autoscaling' where lower(name) in (
  'kubernetes-incubator/cluster-proportional-autoscaler',
  'kubernetes-incubator/cluster-proportional-vertical-autoscaler',
  'kubernetes-sigs/architecture-tracking',
  'kubernetes/autoscaler',
  'kubernetes/cluster-proportional-autoscaler',
  'kubernetes/horizontal-self-scaler'
);

update gha_repos set repo_group = 'SIG CLI' where lower(name) in (
  'kubernetes-sigs/cli-experimental',
  'kubernetes-sigs/cli-utils',
  'kubernetes-sigs/krew',
  'kubernetes-sigs/krew-index',
  'kubernetes-sigs/kustomize',
  'kubernetes/cli-runtime',
  'kubernetes/kubectl',
  'kubernetes/sample-cli-plugin'
);

update gha_repos set repo_group = 'SIG Cloud Provider' where lower(name) in (
  'kubernetes-security/cloud-provider-azure',
  'kubernetes-sigs/alibaba-cloud-csi-driver',
  'kubernetes-sigs/apiserver-network-proxy',
  'kubernetes-sigs/aws-alb-ingress-controller',
  'kubernetes-sigs/aws-ebs-csi-driver',
  'kubernetes-sigs/aws-efs-csi-driver',
  'kubernetes-sigs/aws-encryption-provider',
  'kubernetes-sigs/aws-file-cache-csi-driver',
  'kubernetes-sigs/aws-fsx-csi-driver',
  'kubernetes-sigs/aws-fsx-openzfs-csi-driver',
  'kubernetes-sigs/aws-iam-authenticator',
  'kubernetes-sigs/aws-load-balancer-controller',
  'kubernetes-sigs/aws_encryption-provider',
  'kubernetes-sigs/azuredisk-csi-driver',
  'kubernetes-sigs/azurefile-csi-driver',
  'kubernetes-sigs/blobfuse-csi-driver',
  'kubernetes-sigs/cloud-provider-azure',
  'kubernetes-sigs/cloud-provider-baiducloud',
  'kubernetes-sigs/cloud-provider-huaweicloud',
  'kubernetes-sigs/compute-persistent-disk-csi-driver',
  'kubernetes-sigs/gcp-compute-persistent-disk-csi-driver',
  'kubernetes-sigs/gcp-filestore-csi-driver',
  'kubernetes-sigs/provider-aws-test-infra',
  'kubernetes-sigs/vsphere-csi-driver',
  'kubernetes/cloud-controller-manager',
  'kubernetes/cloud-provider',
  'kubernetes/cloud-provider-alibaba-cloud',
  'kubernetes/cloud-provider-aws',
  'kubernetes/cloud-provider-azure',
  'kubernetes/cloud-provider-gcp',
  'kubernetes/cloud-provider-openstack',
  'kubernetes/cloud-provider-sample',
  'kubernetes/cloud-provider-vsphere',
  'kubernetes/legacy-cloud-providers'
);


update gha_repos set repo_group = 'SIG Cluster Lifecycle' where lower(name) in (
  'kubernetes-incubator/bootkube',
  'kubernetes-incubator/kargo',
  'kubernetes-incubator/kube-aws',
  'kubernetes-incubator/kubespray',
  'kubernetes-retired/kubeadm-dind-cluster',
  'kubernetes-retired/kube-deploy',
  'kubernetes-sigs/addon-operators',
  'kubernetes-sigs/bootkube',
  'kubernetes-sigs/clife_cluster-api',
  'kubernetes-sigs/cluster-api-provider-nested',
  'kubernetes-sigs/cluster-api-provider-packet',
  'kubernetes-sigs/cluster-addons',
  'kubernetes-sigs/etcdadm',
  'kubernetes-sigs/image-builder',
  'kubernetes-sigs/kubeadm-dind-cluster',
  'kubernetes-sigs/kubespray',
  'kubernetes/cluster-bootstrap',
  'kubernetes/kops',
  'kubernetes/kube-deploy',
  'kubernetes/kubeadm',
  'kubernetes/kubernetes-anywhere',
  'kubernetes/minikube',
  'kubernetes/system-validators'
);

update gha_repos set repo_group = 'SIG Cluster Lifecycle (Cluster API)' where lower(name) in (
  'kubernetes-sigs/cluster-api',
  'kubernetes-sigs/cluster-api-operator',
  'kubernetes-sigs/cluster-api-bootstrap-provider-kubeadm',
  'kubernetes-sigs/cluster-api-provider-aws',
  'kubernetes-sigs/cluster-api-provider-azure',
  'kubernetes-sigs/cluster-api-provider-digitalocean',
  'kubernetes-sigs/cluster-api-provider-docker',
  'kubernetes-sigs/cluster-api-provider-gcp',
  'kubernetes-sigs/cluster-api-provider-ibmcloud',
  'kubernetes-sigs/cluster-api-provider-openstack',
  'kubernetes-sigs/cluster-api-provider-vsphere'
);


update gha_repos set repo_group = 'SIG Contributor Experience' where lower(name) in (
  'kubernetes-client/.github',
  'kubernetes-csi/.github',
  'kubernetes-graveyard/md-check',
  'kubernetes-retired/md-check',
  'kubernetes-sigs/contributor-playground',
  'kubernetes-sigs/contributor-site',
  'kubernetes-sigs/contributor-tweets',
  'kubernetes-sigs/discuss-theme',
  'kubernetes-sigs/netlify-test',
  'kubernetes-sigs/slack-infra',
  'kubernetes-sigs/.github',
  'kubernetes/community',
  'kubernetes/k8s.io',
  'kubernetes/md-check',
  'kubernetes/md-format',
  'kubernetes/org',
  'kubernetes/repo-infra',
  'kubernetes/.github'
);

update gha_repos set repo_group = 'SIG Docs' where lower(name) in (
  'kubernetes-incubator/reference-docs',
  'kubernetes-retired/kubernetes-bootcamp',
  'kubernetes-retired/kubernetes-docs-ja',
  'kubernetes-retired/kubernetes-docs-ko',
  'kubernetes-retired/kubernetes-docs-zh',
  'kubernetes-sigs/reference-docs',
  'kubernetes-sigs/website-metadata',
  'kubernetes/kubernetes-bootcamp',
  'kubernetes/kubernetes-docs-cn',
  'kubernetes/kubernetes-docs-ja',
  'kubernetes/kubernetes-docs-ko',
  'kubernetes/kubernetes-docs-zh',
  'kubernetes/kubernetes.github.io',
  'kubernetes/website'
);

update gha_repos set repo_group = 'SIG Instrumentation' where lower(name) in (
  'kubernetes-incubator/custom-metrics-apiserver',
  'kubernetes-incubator/metrics-server',
  'kubernetes-retired/heapster',
  'kubernetes-sigs/custom-metrics-apiserver',
  'kubernetes-sigs/instrumentation-tools',
  'kubernetes-sigs/metrics-server',
  'kubernetes-sigs/mutating-trace-admission-controller',
  'kubernetes/heapster',
  'kubernetes/klog',
  'kubernetes/kube-state-metrics',
  'kubernetes/metrics'
);

update gha_repos set repo_group = 'SIG Multicluster' where lower(name) in (
  'googlecloudplatform/k8s-multicluster-ingress',
  'kubernetes-retired/federation',
  'kubernetes-sigs/federation-v2',
  'kubernetes-sigs/kubefed',
  'kubernetes-sigs/mcs-api',
  'kubernetes/cluster-registry',
  'kubernetes/federation'
);

update gha_repos set repo_group = 'SIG Network' where lower(name) in (
  'kubernetes-incubator/external-dns',
  'kubernetes-incubator/ip-masq-agent',
  'kubernetes-sigs/alb-ingress-controller',
  'kubernetes-sigs/cluster-proportional-autoscaler',
  'kubernetes-sigs/cluster-proportional-vertical-autoscaler',
  'kubernetes-sigs/external-dns',
  'kubernetes-sigs/ingress-controller-conformance',
  'kubernetes-sigs/iptables-wrappers',
  'kubernetes-sigs/ip-masq-agent',
  'kubernetes-sigs/service-apis',
  'kubernetes/dns',
  'kubernetes/ingress',
  'kubernetes/ingress-gce',
  'kubernetes/ingress-nginx'
);

update gha_repos set repo_group = 'SIG Node' where lower(name) in (
  -- renamed and deleted repositores are kept in the list for the stats from the past
  -- list of SIG Node projects: https://github.com/kubernetes/community/tree/master/sig-node#subprojects
  'kubernetes-incubator/cri-containerd',   -- renamed to https://github.com/containerd/cri
  'kubernetes-incubator/cri-o',            -- renamed to https://github.com/cri-o/cri-o
  'kubernetes-incubator/cri-tools',        -- renamed to https://github.com/kubernetes-sigs/cri-tools
  'kubernetes-incubator/node-feature-discovery', -- renamed to https://github.com/kubernetes-sigs/node-feature-discovery
  'kubernetes-incubator/ocid',             -- renamed to https://github.com/cri-o/cri-o
  'kubernetes-incubator/rktlet',           -- renamed to kubernetes-retired/rktlet
  'kubernetes-retired/rktlet',             -- EOL. Archived
  'kubernetes-sigs/cri-o',                 -- renamed to https://github.com/cri-o/cri-o
  'kubernetes-sigs/cri-tools',
  'kubernetes-sigs/node-feature-discovery',
  'kubernetes-sigs/node-feature-discovery-operator',
  'kubernetes-sigs/security-profiles-operator',
  'kubernetes/cri-api',
  'kubernetes/frakti',
  'kubernetes/node-api',                   -- EOL. This is no longer maintained
  'kubernetes/node-problem-detector',
  'kubernetes/ocid',                       -- ocid is part of cri-o now. This repository doesn't exist any longer
  'kubernetes/rktlet'                      -- renamed to https://github.com/kubernetes-retired/rktlet
);

update gha_repos set repo_group = 'SIG Release' where lower(name) in (
  'kubernetes-sigs/downloadkubernetes',
  'kubernetes-sigs/k8s-container-image-promoter',
  'kubernetes-sigs/mdtoc',
  'kubernetes-sigs/release-notes',
  'kubernetes-sigs/relnotes',
  'kubernetes-sigs/zeitgeist',
  'kubernetes/publishing-bot',
  'kubernetes/release',
  'kubernetes/sig-release'
);

update gha_repos set repo_group = 'SIG Scalability' where lower(name) in (
  'kubernetes/perf-tests'
);

update gha_repos set repo_group = 'SIG Scheduling' where lower(name) in (
  'kubernetes-incubator/cluster-capacity',
  'kubernetes-incubator/descheduler',
  'kubernetes-incubator/kube-arbitrator',
  'kubernetes-incubator/rescheduler',
  'kubernetes-sigs/cluster-capacity',
  'kubernetes-sigs/descheduler',
  'kubernetes-sigs/kube-batch',
  'kubernetes-sigs/poseidon',
  'kubernetes-sigs/scheduler-plugins',
  'kubernetes-sigs/scheduling_poseidon',
  'kubernetes-sigs/volcano'
);

update gha_repos set repo_group = 'SIG Service Catalog' where lower(name) in (
  'kubernetes-incubator/service-catalog',
  'kubernetes-sigs/go-open-service-broker-client',
  'kubernetes-sigs/minibroker',
  'kubernetes-sigs/service-catalog'
);

update gha_repos set repo_group = 'SIG Storage' where lower(name) in (
  'kubernetes-csi/cluster-driver-registrar',
  'kubernetes-csi/csi-driver-cinder',
  'kubernetes-csi/csi-driver-fibre-channel',
  'kubernetes-csi/csi-driver-flex',
  'kubernetes-csi/csi-driver-host-path',
  'kubernetes-csi/csi-driver-image-populator',
  'kubernetes-csi/csi-driver-iscsi',
  'kubernetes-csi/csi-driver-nfs',
  'kubernetes-csi/csi-driver-smb',
  'kubernetes-csi/csi-flex-provisioner',
  'kubernetes-csi/csi-lib-common',
  'kubernetes-csi/csi-lib-fc',
  'kubernetes-csi/csi-lib-iscsi',
  'kubernetes-csi/csi-lib-utils',
  'kubernetes-csi/csi-proxy',
  'kubernetes-csi/csi-release-tools',
  'kubernetes-csi/csi-test',
  'kubernetes-csi/docs',
  'kubernetes-csi/driver-registrar',
  'kubernetes-csi/drivers',
  'kubernetes-csi/external-attacher',
  'kubernetes-csi/external-attacher-csi',
  'kubernetes-csi/external-health-monitor',
  'kubernetes-csi/external-provisioner',
  'kubernetes-csi/external-provisioner-csi',
  'kubernetes-csi/external-resizer',
  'kubernetes-csi/external-snapshotter',
  'kubernetes-csi/flex-provisioner',
  'kubernetes-csi/kubernetes-csi-migration-library',
  'kubernetes-csi/kubernetes-csi.github.io',
  'kubernetes-csi/livenessprobe',
  'kubernetes-csi/node-driver-registrar',
  'kubernetes-csi/resources',
  'kubernetes-incubator/external-storage',
  'kubernetes-incubator/nfs-provisioner',
  'kubernetes-retired/nfs-provisioner',
  'kubernetes-sigs/sig-storage-lib-external-provisioner',
  'kubernetes-sigs/sig-storage-local-static-provisioner',
  'kubernetes/csi-api',
  'kubernetes/csi-translation-lib',
  'kubernetes/git-sync',
  'kubernetes/mount-utils',
  'kubernetes-retired/external-storage',
  'kubernetes-sigs/blob-csi-driver',
  'kubernetes-sigs/container-object-storage-interface-controller',
  'kubernetes-sigs/container-object-storage-interface-csi-adapter',
  'kubernetes-sigs/container-object-storage-interface-provisioner-sidecar',
  'kubernetes-sigs/container-object-storage-interface-spec',
  'kubernetes-sigs/gluster-block-external-provisioner',
  'kubernetes-sigs/gluster-file-external-provisioner',
  'kubernetes-sigs/nfs-ganesha-server-and-external-provisioner',
  'kubernetes-sigs/nfs-subdir-external-provisioner'
);

update gha_repos set repo_group = 'SIG Testing' where lower(name) in (
  'kubernetes-retired/testing_frameworks',
  'kubernetes-sigs/boskos',
  'kubernetes-sigs/k8s-gsm-tools',
  'kubernetes-sigs/kind',
  'kubernetes-sigs/kubetest2',
  'kubernetes-sigs/secret-sync-rotation',
  'kubernetes-sigs/testing_frameworks',
  'kubernetes-sig-testing/frameworks',
  'kubernetes/pr-bot',
  'kubernetes/test-infra'
);

update gha_repos set repo_group = 'SIG UI' where lower(name) in (
  'kubernetes-graveyard/kube-ui',
  'kubernetes-retired/kube-ui',
  'kubernetes-sigs/dashboard-metrics-scraper',
  'kubernetes/console',
  'kubernetes/dashboard',
  'kubernetes/kube-ui',
  'kubernetes/kubernetes-console'
);

update gha_repos set repo_group = 'SIG Usability' where lower(name) in (
  'kubernetes-sigs/sig-usability'
);

update gha_repos set repo_group = 'SIG Windows' where lower(name) in (
  'kubernetes-sigs/sig-windows-samples',
  'kubernetes-sigs/sig-windows-tools',
  'kubernetes-sigs/windows-gmsa',
  'kubernetes-sigs/windows-testing'
);

update gha_repos set repo_group = 'Product Security Committee' where lower(name) in (
  'kubernetes/security'
);

update gha_repos set repo_group = 'Steering Committee' where lower(name) in (
  'kubernetes-incubator/spartakus',
  'kubernetes-retired/spartakus',
  'kubernetes/funding',
  'kubernetes/kubernetes-template-project',
  'kubernetes/steering'
);

-- All other unknown repositories should have 'Other' repository group
update gha_repos set repo_group = 'Other' where repo_group is null;

with repo_latest as (
  select sub.repo_id,
    sub.repo_name
  from (
    select repo_id,
      dup_repo_name as repo_name,
      row_number() over (partition by repo_id order by created_at desc, id desc) as row_num
    from
      gha_events
  ) sub
  where
    sub.row_num = 1
)
update
  gha_repos r
set
  alias = (
    select rl.repo_name
    from
      repo_latest rl
    where
      rl.repo_id = r.id
  )
where
  r.name like '%_/_%'
  and r.name not like '%/%/%'
;

update gha_repos set alias = 'kubernetes/kubernetes' where name like '%kubernetes' or name = 'kubernetes/';

select
  repo_group,
  count(*) as number_of_repos
from
  gha_repos
where
  repo_group is not null
  and name like '%_/_%'
  and name not like '%/%/%'
group by
  repo_group
order by
  number_of_repos desc,
  repo_group asc;

