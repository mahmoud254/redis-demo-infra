resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = var.elasticache_subnet_group_name
  subnet_ids = var.elasticache_subnet_group_subnet_ids_list
    tags = {
    Name = var.elasticache_subnet_group_name
  }
}