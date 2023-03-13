variable env {
    type = string
}

variable infrastructure_region {
  type = string
}

#####################################################
#   vpc
#####################################################

variable vpc_cidr_block {
    type = string
}

variable vpc_name {
  type = string
}

#####################################################
#  security group
#####################################################

variable sg_name_redis{
  type = string
}

variable ingress_from_port_redis{
  type = number
}

variable ingress_to_port_redis{
  type = number
}

variable ingress_protocol_redis{
  type = string
}

variable egress_from_port_redis{
  type = number
}

variable egress_to_port_redis{
  type = number
}

variable egress_protocol_redis{
  type = string
}

variable egress_cidr_blocks_list_redis{
  type = list
}


#####################################################
#  eks
#####################################################

variable cluster_name {
    type = string
}

variable cluster_version {
  type = string
}

#####################################################
#  eks_node_group
#####################################################

variable test_dev_apps_nodegroup_name {
  type = string
}

variable test_dev_apps_node_group_desired_size {
  type = number
}

variable test_dev_apps_node_group_min_size {
  type = number
}

variable test_dev_apps_node_group_max_size {
  type = number
}

variable test_dev_apps_node_group_ami_type {
  type = string
}

variable test_dev_apps_node_group_capacity_type {
  type = string
}

variable test_dev_apps_node_group_disk_size {
  type = number
}


variable test_dev_apps_node_group_instance_types {
  type = list
}

variable test_dev_apps_node_group_role {
  type = string
}

variable test_dev_apps_taint_key {
  type = string
}

variable test_dev_apps_taint_value {
  type = string
}

variable test_dev_apps_taint_effect {
  type = string
}

variable test_dev_apps_use_taint {
  type = bool
}

#####################################################
#  elasticache_subnet_group
#####################################################

variable test_elasticache_private_subnet_name {
  type = string
}

#####################################################
#  elasticache
#####################################################

variable test_redis_name {
  type = string
}

variable test_redis_engine {
  type = string
}

variable test_redis_node_type {
  type = string
}

variable test_redis_node_count {
  type = string
}

variable test_redis_parameter_group_name {
  type = string
}

variable test_redis_version {
  type = string
}

variable test_redis_port {
  type = string
}

variable ecr_name {
  type = string
}

#####################################################
#  Addons
#####################################################

