provider "aws" {
  region                  = var.region
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.profile
}

resource "aws_instance" "this" {
  count = var.instance_count

  ami           = var.ami
  instance_type = var.instance_type
  user_data     = "${file("install_devopsweb.sh")}"
  subnet_id = var.subnet_id
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids

  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(
    {
      "Name" = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    },
    var.tags,
  )

  volume_tags = merge(
    {
      "Name" = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    },
    var.volume_tags,
  )

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = ""
      private_key = "${file(var.private_key)}"
      host = "${self.public_ip}"
    }

    inline = [
      "sudo hostnamectl set-hostname ${self.tags.Name}",
    ]
  }
}
