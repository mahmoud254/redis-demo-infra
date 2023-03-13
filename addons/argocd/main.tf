data "template_file" "namespace_argocd" {
  template = file("${path.module}/templates/namespace.yaml")
}

resource "null_resource" "argocd" {
  depends_on = [var.addon_depends_on_nodegroup_no_taint]
  provisioner "local-exec" {
    command = <<EOT
            echo  '${data.template_file.namespace_argocd.rendered}' | kubectl apply -f -
            kubectl apply -n argocd -f "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
    EOT
  }
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
            kubectl delete -f "https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
    EOT
  }
}