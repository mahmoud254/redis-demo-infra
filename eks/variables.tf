variable env {
  type = string
}

variable infrastructure_region {
  type = string
}

variable cluster_name {
    type = string
}

variable cluster_version {
    type = string
}

variable subnets_id_list {
  type = list
}

# variable esk_security_group_ids {
#   type = set(string)
# }