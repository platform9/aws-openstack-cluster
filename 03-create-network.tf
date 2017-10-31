resource "aws_vpc" "os_vpc" {
  cidr_block = "10.0.0.0/16"
  tags { Name = "pf9_openstack_vpc" }
}

resource "aws_subnet" "os_subnet" {
  vpc_id            = "${aws_vpc.os_vpc.id}"
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags { Name = "pf9_openstack_subnet" }
}

resource "aws_internet_gateway" "os_gw" {
  vpc_id = "${aws_vpc.os_vpc.id}"
  tags { Name = "pf9_openstack_gateway" }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.os_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.os_gw.id}"
}
