module "node_autoscaler" {
  source                         = "./node_autoscaler"
  cluster_name                   = "${var.cluster_name}-${var.env}"
  region                         = var.region
  addon_depends_on_nodegroup_no_taint          = var.addon_depends_on_nodegroup_no_taint
}

module "hpa" {
  source                = "./hpa"
  addon_depends_on_nodegroup_no_taint = var.addon_depends_on_nodegroup_no_taint
}


module "alb_ingress" {
  source                        = "./alb_ingress"
  eks_alb_role_arn              = var.eks_alb_role_arn
  addon_depends_on_nodegroup_no_taint         = var.addon_depends_on_nodegroup_no_taint
  cluster_name = "${var.cluster_name}-${var.env}"
}

# module "nginx_ingress" {
#   source                        = "./nginx_ingress"
#   addon_depends_on_nodegroup_no_taint         = var.addon_depends_on_nodegroup_no_taint
# }

module "argocd" {
  source                        = "./argocd"
  addon_depends_on_nodegroup_no_taint         = var.addon_depends_on_nodegroup_no_taint
}