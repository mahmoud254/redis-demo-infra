variable env {
    type = string
}

variable vpc_id {
    type = string
}

variable sg_name{
  type = string
}

variable ingress_from_port{
  type = number
}

variable ingress_to_port{
  type = number
}

variable ingress_protocol{
  type = string
}

variable egress_from_port{
  type = number
}

variable egress_to_port{
  type = number
}

variable egress_protocol{
  type = string
}

variable egress_cidr_blocks_list{
  type = list
}

variable "security_groups_list" {
  type = set(string)
}
