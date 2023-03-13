resource "helm_release" "hpa" {
  name            = "hpa"
  repository      = "https://kubernetes.github.io/kube-state-metrics"
  chart           = "kube-state-metrics" # "bitnami/metrics-server"
  namespace       = "kube-system"
  depends_on = [var.addon_depends_on_nodegroup_no_taint]
}
