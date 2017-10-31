Platform9 Managed OpenStack cluster running on AWS
==================================================
[platform9.com](http://platform9.com)  [@Platfomr9Sys](http://twitter.com/platform9sys)

This is a [Terraform](http://terraform.io) "Manifest" that will build a fully functional 
OpenStack enviorment on top of AWS resources. This is intended for testing purposes only.

Prerequisites
-------------
Make sure that [Terraform is installed.](https://www.terraform.io/intro/getting-started/install.html)

Clone this repo `git clone https://github.com/platform9/aws-openstack-cluster.git`

Move into the git repo directory. `cd aws-openstack-cluster`

Update the `credentials` file to authenticate to AWS
```
[default]
aws_access_key_id = "1234567890"
aws_secret_access_key = "1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik9ol0p"
```

Usage
-----
```bash
  terraform init #might require sudo
  terraform plan -var 'key_name={}' -var 'OS_AUTH_URL=[]' -var 'OS_REGION_NAME={}' -var 'OS_USERNAME={}' -var 'OS_PASSWORD={}' -var 'OS_TENANT_NAME={}' -var 'OS_TENANT_NAME={}' -var 'PF9_Account_Endpoint={}' -out=my-tf.plan
  # For example:
  # terraform plan -var 'key_name=MySSHKey' -var 'OS_AUTH_URL=https://endpoint.platform9.net/keystone/v2.0' -var 'OS_REGION_NAME=Region1' -var 'OS_USERNAME=user@email.tld' -var 'OS_PASSWORD=S0meP@$$' -var 'OS_TENANT_NAME=service' -var 'PF9_Account_Endpoint=endpoint.platform9.net' -out=my-tf.plan
  terraform apply my-tf.plan
```
