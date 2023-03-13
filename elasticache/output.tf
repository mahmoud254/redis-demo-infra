output "arn" {
    value = aws_elasticache_cluster.aws_elasticache_cluster.arn
}

output "redis_address" {
  value = aws_elasticache_cluster.aws_elasticache_cluster.cache_nodes[0].address
}