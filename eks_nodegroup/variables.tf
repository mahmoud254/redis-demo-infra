variable env {
  type        = string
}

variable cluster_name {
  type        = string
}

variable node_group_name {
  type        = string
}


variable node_group_desired_size {
    type = number
}

variable node_group_max_size {
    type = number
}

variable node_group_min_size {
    type = number
}

variable node_group_ami_type {
  type        = string
}

variable node_group_capacity_type {
  type        = string
}

variable node_group_disk_size {
    type = number
}

variable node_group_instance_types {
    type = list
}

variable node_group_version {
  type        = string
}

variable taint_key {
  type        = string
}

variable taint_value {
  type        = string
}

variable taint_effect {
  type        = string
}

variable node_group_subnets {
  type = list
}

variable node_group_role {
  type = string
}

variable use_taint {
  type = bool
  default = false
}

variable eks_cluster_arn {
  type = string
}