data "aws_availability_zones" "available" {
  exclude_zone_ids = var.exclude_zone_ids
}

resource "aws_subnet" "public_subnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.0.${count.index*16}.0/20"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private_subnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "10.0.${(count.index+length(aws_subnet.public_subnets))*16}.0/20"
  availability_zone= "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
  tags =  {
    Name = "PrivateSubnet"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}