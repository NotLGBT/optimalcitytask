resource "helm_release" "my_chart" {
  name       = var.chart_name
  repository = var.helm_repo_url
  chart      = var.chart_name
  namespace  = var.namespace

  # values = [
  #   file("${path.module}/values.yaml") 
  # ]

  depends_on = [var.cluster]
}
