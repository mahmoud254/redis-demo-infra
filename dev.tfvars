# ------------------------------------------------------
#                       General                        #
# ------------------------------------------------------

env = "DEV"
infrastructure_region = "eu-central-1"

# ------------------------------------------------------
#                       EKS Cluster                    #
# ------------------------------------------------------
cluster_name = "MAHMOUD-ALAA-Test"
cluster_version = "1.24"
# ------------------------------------------------------
#                       NODE GROUPS                    #
# ------------------------------------------------------
test_dev_apps_nodegroup_name = "DEV-APPLICATIONS-NODEGROUP"
test_dev_apps_node_group_desired_size = 2
test_dev_apps_node_group_min_size = 1
test_dev_apps_node_group_max_size = 2
test_dev_apps_node_group_ami_type = "AL2_x86_64"
test_dev_apps_node_group_capacity_type = "ON_DEMAND"
test_dev_apps_node_group_disk_size = 100
test_dev_apps_node_group_instance_types = ["t3.medium", "t3.large"]
test_dev_apps_node_group_role = "eks-node-groups"
test_dev_apps_use_taint = false
test_dev_apps_taint_key = ""
test_dev_apps_taint_value = ""
test_dev_apps_taint_effect = ""

# ------------------------------------------------------
#                       VPC                            #
# ------------------------------------------------------
vpc_cidr_block = "10.0.0.0/16"
vpc_name = "test"
exclude_zone_ids = [ "use1-az1","use1-az2","use1-az3","use1-az5"]
# ------------------------------------------------------
#                       SG                             #
# ------------------------------------------------------

sg_name_redis = "MAHMOUD-ALAA-TEST-REDIS"
ingress_from_port_redis = 6379
ingress_to_port_redis = 6379
ingress_protocol_redis = "tcp"
egress_from_port_redis = 0
egress_to_port_redis = 0
egress_protocol_redis = "-1"
egress_cidr_blocks_list_redis = ["0.0.0.0/0"]

# ------------------------------------------------------
#                elasticache_subnet_group               #
# ------------------------------------------------------

# must be lowercase
test_elasticache_private_subnet_name = "mahmoud-alaa-test-private-elasticache-subnets-group"

# ------------------------------------------------------
#                        elasticache                    #
# ------------------------------------------------------

test_redis_name = "mahmoud-alaa-test"
test_redis_engine = "redis"
test_redis_node_type = "cache.t3.micro"
test_redis_node_count = "1"
test_redis_parameter_group_name = "default.redis7"
test_redis_version = "7.0"
test_redis_port = "6379"

ecr_name = "backend"