# k8s-resource

xquare k8s-resource의 **선언적 관리**와 **GitOps** 를 위한 repository 입니다.

cluster의 **현 상태를 정확하고 투명**하게 파악하며, **누가 언제 어떤 변경을 적용했는지 기록**하는 것을 목표로 합니다.

## Structures of Directory
  ### [`/apps/*`](https://github.com/team-xquare/k8s-resource/tree/main/apps)
  - Argo CD로 관리하는 서비스 Application들의 manifest 파일들이 위치합니다.
  - `main` branch의 변경이 Argo CD에 의해 cluster에 자동 적용됩니다.

  ### [`/charts/*`](https://github.com/team-xquare/k8s-resource/tree/main/charts)
  - Helm으로 관리하는 Chart들이 정의되어 있습니다.
  - 기본적으로 설치되어야 하고 자주 변하지 않는 인프라 요소 (istio, karpenter, argoCD)가 포함됩니다.
  - 오픈소스의 Chart를 바로 사용하지 않고, `dependencies`에 이들을 포함한 새로운 Chart를 정의하고 `values.yaml`로 필요한 부분을 override 하고 있습니다.
  - Github pages로 [`ghp_pages`](https://github.com/team-xquare/k8s-resource/tree/gh-pages) branch에 대해 chart를 배포하고 [Terraform helm provider](https://github.com/team-xquare/xquare-infrastructure-global/blob/main/helm.tf)를 통해 서버에 적용합니다.

## Related Repositories

  ### [xquare-infrastructure-global](https://github.com/team-xquare/xquare-infrastructure-global)
  - 해당 repository에서 helm 배포 및 전체 AWS 인프라를 Terraform으로 관리합니다 

  ### [xquare-gitops-repo](https://github.com/team-xquare/xquare-gitops-repo)
  - 개발한 project에 대한 chart를 관리합니다. Argo CD로 관리됩니다.


