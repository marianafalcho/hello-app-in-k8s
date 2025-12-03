resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.14.0"

  namespace        = "ingress-nginx"
  create_namespace = true

  values = [file("nginx_ingress_configs.yaml")]

  depends_on = [kind_cluster.this]
}