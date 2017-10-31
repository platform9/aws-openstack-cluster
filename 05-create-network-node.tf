data "template_file" "net_cloud_init" {
  template = "${file("configs/network_node.conf")}"
  vars {
    External_Net_Gateway = "${var.External_Net_Gateway}",
    External_Net_Netmask = "${var.External_Net_Netmask}",
    PF9_Account_Endpoint = "${var.PF9_Account_Endpoint}",
    OS_REGION_NAME       = "${var.OS_REGION_NAME}",
    OS_USERNAME          = "${var.OS_USERNAME}",
    OS_PASSWORD          = "${var.OS_PASSWORD}"  
  }
}

resource "aws_instance" "network_node" {
  ami               = "${var.ami}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  key_name          = "${var.key_name}"
  security_groups   = ["${aws_security_group.sg_os_net_node.id}", "${aws_security_group.sg_os_general.id}"]
  subnet_id         = "${aws_subnet.os_subnet.id}"
  user_data         = "${data.template_file.net_cloud_init.rendered}"
  tags              = { Name = "pf9_os_net_node" }
  root_block_device {
    volume_size = "${var.root_disk_size}"
    volume_type = "gp2"
  }
  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = "${var.glance_store_size}"
    volume_type = "gp2"
  }
  ebs_block_device {
    device_name = "/dev/xvdc"
    volume_size = "${var.cinder_pool_size}"
    volume_type = "gp2"
  }
}
