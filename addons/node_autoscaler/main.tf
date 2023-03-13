data "template_file" "cluster_autoscaler" {
  template = file("${path.module}/templates/values.yaml")
  vars = {
    cluster_name = "${var.cluster_name}"
    region= "${var.region}"
  }
}

resource "helm_release" "cluster-autoscaler" {
  name            = "cluster-autoscaler"
  repository      = "https://kubernetes.github.io/autoscaler/"
  chart           = "cluster-autoscaler"
  namespace       = "kube-system"
  values = [ data.template_file.cluster_autoscaler.rendered ]
  depends_on = [var.addon_depends_on_nodegroup_no_taint]
}


