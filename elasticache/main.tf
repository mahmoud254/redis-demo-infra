resource "aws_elasticache_cluster" "aws_elasticache_cluster" {
  cluster_id           = var.elasticache_name
  engine               = var.elasticache_engine # "redis"
  node_type            = var.elasticache_node_type # "cache.t2.micro"
  num_cache_nodes      = var.elasticache_node_count # 1
  parameter_group_name = var.elasticache_parameter_group_name # "default.redis3.2"
  port                 = var.elasticache_port
  security_group_ids   = var.elasticache_security_group_ids
  subnet_group_name    = var.elasticache_subnet_group_name
  engine_version       = var.engine_version
}