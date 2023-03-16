module "test_vpc" {
    source = "./vpc"
    env = var.env
    # cluster_name is needed for EKS to work, can be omitted if not using EKS
    cluster_name = "${var.cluster_name}-${var.env}"  
    vpc_name = var.vpc_name
    vpc_cidr_block = var.vpc_cidr_block
    exclude_zone_ids = var.exclude_zone_ids
}

module "test_redis_sg" {
    source = "./sg/sg_cidr_blocks_ips"
    env = var.env
    vpc_id = module.test_vpc.vpc_id
    sg_name = var.sg_name_redis
    ingress_from_port = var.ingress_from_port_redis
    ingress_to_port = var.ingress_to_port_redis
    ingress_protocol = var.ingress_protocol_redis
    ingress_cidr_blocks_list = [var.vpc_cidr_block]
    egress_from_port = var.egress_from_port_redis
    egress_to_port = var.egress_to_port_redis
    egress_protocol = var.egress_protocol_redis
    egress_cidr_blocks_list = var.egress_cidr_blocks_list_redis
}

module "test_elasticache_private_subnet_group" {
    source = "./elasticache_subnet_group"
    env = var.env
    elasticache_subnet_group_name = "${var.test_elasticache_private_subnet_name}-${lower(var.env)}"
    elasticache_subnet_group_subnet_ids_list = [for subnet in module.test_vpc.private_subnets: subnet.id]
}

module "test_redis" {
    source = "./elasticache"
    env = var.env
    elasticache_name = var.test_redis_name
    elasticache_engine = var.test_redis_engine
    elasticache_node_type = var.test_redis_node_type
    elasticache_node_count = var.test_redis_node_count
    elasticache_parameter_group_name = var.test_redis_parameter_group_name
    engine_version = var.test_redis_version
    elasticache_port = var.test_redis_port
    elasticache_subnet_group_name = module.test_elasticache_private_subnet_group.name
    elasticache_security_group_ids = [module.test_redis_sg.security_group_id]
}

module "test_eks" {
    source = "./eks"
    env = var.env
    infrastructure_region = var.infrastructure_region
    cluster_version = var.cluster_version
    cluster_name = "${var.cluster_name}-${var.env}"
    subnets_id_list = concat(
        [for subnet in module.test_vpc.public_subnets: subnet.id],
        [for subnet in module.test_vpc.private_subnets: subnet.id]
    )
    # esk_security_group_ids = toset([module.test_eks_sg.security_group_id])
}

module "test_dev_apps_nodegroup" {
    source = "./eks_nodegroup"
    env = var.env
    cluster_name = module.test_eks.eks_cluster_name
    eks_cluster_arn = module.test_eks.eks_cluster_arn
    node_group_name = "${var.test_dev_apps_nodegroup_name}"
    node_group_version = var.cluster_version
    node_group_subnets = [for subnet in module.test_vpc.private_subnets: subnet.id]
    node_group_desired_size = var.test_dev_apps_node_group_desired_size
    node_group_min_size = var.test_dev_apps_node_group_min_size
    node_group_max_size = var.test_dev_apps_node_group_max_size
    node_group_ami_type = var.test_dev_apps_node_group_ami_type
    node_group_capacity_type = var.test_dev_apps_node_group_capacity_type
    node_group_disk_size = var.test_dev_apps_node_group_disk_size
    node_group_instance_types = var.test_dev_apps_node_group_instance_types
    node_group_role = var.test_dev_apps_node_group_role
    taint_key = var.test_dev_apps_taint_key
    taint_value = var.test_dev_apps_taint_value
    taint_effect = var.test_dev_apps_taint_effect  
    use_taint = var.test_dev_apps_use_taint
}


module "test_eks_addons" {
    source = "./addons"
    env = var.env
    cluster_name = var.cluster_name
    region = var.infrastructure_region
    addon_depends_on_nodegroup_no_taint = module.test_dev_apps_nodegroup.node_group_without_taint_arn
    eks_alb_role_arn = module.test_eks.eks_alb_role_arn
}


module "backend_ecr" {
    source = "./ecr"
    env = lower(var.env)
    ecr_name = var.ecr_name
}