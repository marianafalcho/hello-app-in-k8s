resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "4.9.7"

  namespace        = "argocd"
  create_namespace = true

  values = [
    file("argocd_application.yaml")
  ]

  depends_on = [kind_cluster.this]
}