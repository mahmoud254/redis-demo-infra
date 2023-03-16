variable env {
    type = string
}

variable vpc_cidr_block {
    type = string
}

variable cluster_name {
  type = string
  default = "EKS-CLUSTER"
}

variable vpc_name {
  type = string
}

variable exclude_zone_ids {
  type = list
  default = null
}