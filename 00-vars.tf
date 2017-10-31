variable "region" {
  default = "us-east-1"
}

variable "key_name" {
}

variable "ami"{
  default = "ami-db48ada1"
}

variable "instance_type"{
  default = "m4.xlarge"
}

variable "kvm_host_count"{
  default = 1
}

variable "root_disk_size"{
  default = 20
}

variable "glance_store_size"{
  default = 100
}

variable "cinder_pool_size"{
  default = 100
}

variable "kvm_host_instance_size"{
  default = 100
}

variable "OS_AUTH_URL"{
}

variable "OS_REGION_NAME"{
}

variable "OS_USERNAME"{
}

variable "OS_PASSWORD"{
}

variable "OS_TENANT_NAME"{
}

variable "PF9_Account_Endpoint"{
}

variable "External_Net_CIDR"{
  default = "192.168.191.0/24"
}

variable "External_Net_Gateway"{
  default = "192.168.191.1"
}

variable "External_Net_Netmask"{
  default = "255.255.255.0"
}

variable "OS_Global_Domain"{
  default = "os.pf9.local"
}

variable "OS_Global_DNS1"{
  default = "8.8.8.8"
}

variable "OS_Global_DNS2"{
  default = "8.8.4.4"
}
