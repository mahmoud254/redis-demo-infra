resource "helm_release" "external_secret" {
  depends_on = [var.addon_depends_on_nodegroup_no_taint]
  name       = "external-secrets"
  repository = "https://external-secrets.github.io/kubernetes-external-secrets/"
  chart      = "kubernetes-external-secrets"

  set {
    name  = "env.AWS_REGION"
    value = "${var.region}"
  }

  set {
    name  = "env.POLLER_INTERVAL_MILLISECONDS"
    value = "86400000"
  }
} 