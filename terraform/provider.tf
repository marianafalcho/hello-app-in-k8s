# Provider used to deploy helm charts using terraform
provider "helm" {
  kubernetes = {
    config_path = local.kubeconfig
  }
}

# Provide to deploy kind cluster
provider "kind" {}