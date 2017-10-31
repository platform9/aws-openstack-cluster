resource "aws_security_group" "sg_os_net_node" {
  name            = "pf9_os_net_node"
  description     = "Allow Inbound glance from anywhere"
  vpc_id          = "${aws_vpc.os_vpc.id}"

  ingress {
    from_port     = 9292
    to_port       = 9292
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_os_kvm_node" {
  name            = "pf9_os_kvm_node"
  description     = "Allow Inbound NoVNC from anywhere"
  vpc_id          = "${aws_vpc.os_vpc.id}"

  ingress {
    from_port     = 6080
    to_port       = 6080
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_os_general" {
  name            = "pf9_os_allow_all_local"
  description     = "Allow all outbound, inbound from self, and allow inbound ssh from anywhere"
  vpc_id          = "${aws_vpc.os_vpc.id}"

  ingress {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  ingress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    self          = true
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }
}
