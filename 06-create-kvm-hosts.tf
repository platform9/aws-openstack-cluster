data "template_file" "kvm_cloud_init" {
  template = "${file("configs/kvm_host.conf")}"
  vars {
    PF9_Account_Endpoint = "${var.PF9_Account_Endpoint}",
    OS_REGION_NAME       = "${var.OS_REGION_NAME}",
    OS_USERNAME          = "${var.OS_USERNAME}",
    OS_PASSWORD          = "${var.OS_PASSWORD}"  
  }
}

resource "aws_instance" "kvm_host" {
  count             = "${var.kvm_host_count}"
  ami               = "${var.ami}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  key_name          = "${var.key_name}"
  security_groups   = ["${aws_security_group.sg_os_kvm_node.id}", "${aws_security_group.sg_os_general.id}"]
  subnet_id         = "${aws_subnet.os_subnet.id}"
  user_data         = "${data.template_file.kvm_cloud_init.rendered}"
  tags              = { Name = "pf9_os_kvm_host_${count.index}" }
  root_block_device {
    volume_size = "${var.root_disk_size}"
    volume_type = "gp2"
  }
  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = "${var.kvm_host_instance_size}"
    volume_type = "gp2"
  }
}
