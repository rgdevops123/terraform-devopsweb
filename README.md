# terraform-devopsweb

- Launch DEVOPSWEB EC2 instances with Terraform.

## Before Launch.

```
   Download and Unizp Terraform:
  https://www.terraform.io/downloads.html

$ unzip terraform_<VERSION>_linux_amd64.zip

   Copy to /usr/bin:
$ sudo cp terraform /usr/bin

   Confirm Terraform installed:
$ ls -l /usr/bin/terraform 
-rwxr-xr-x 1 root root 49424832 Aug  7 17:34 /usr/bin/terraform

$ terraform -v
Terraform v<VERSION>


   Create a Terraform User in AWS:
GoTo: IAM, Users,
Click "Add User"
Enter: "terraform_user"
Click "Next"
Click: "Attach existing policies directly."
Select "AmazonEC2FullAccess"
Click "Next"
Store the AWS access key id and secret access key

   Update Credentials File:
$ vim ~/.aws/credentials
[terraform]
aws_access_key_id = xxxxxxxxxxxxxxxxxxx
aws_secret_access_key = xxx/xxxxxxxxxxxxx/xxxx
```

- Update the the variables in variables.tf.
```
vi variables.tf
```

### Provision Servers.
   - Execute terraform commands.
```
   Initialize Terraform:
$ terraform init


   Show what Terraform will do. No execution.
$ terraform plan


   Create the instance:
$ terraform apply
```

### Access your Servers.
   - Connect to Instance.
```
ssh -i <YOUR_SSH_KEY>.pem centos@<INSTANCE_PUBLIC_IP>
```

### View DEVOPSWEB.
   - View on Browser.
```
http://<INSTANCE_PUBLIC_IP>
```
