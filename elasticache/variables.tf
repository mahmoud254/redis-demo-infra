variable "env" {
    type = string
}

variable "elasticache_name" {
    type = string
}

variable "elasticache_engine" {
    type = string
}
variable "elasticache_node_type" {
    type = string
}
variable "elasticache_node_count" {
    type = string
}
variable "elasticache_parameter_group_name" {
    type = string
}
variable "elasticache_port" {
    type = string
}
variable "elasticache_subnet_group_name" {
    type = string
}
variable "elasticache_security_group_ids" {
    type = set(string)
}
variable "engine_version" {
    type = string
}