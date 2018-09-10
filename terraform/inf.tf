provider "aws" {
  region  = "${var.region}"
  profile = "${var.aws_profile}"
}


resource "aws_instance" "AnsibleMaster" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"

  tags {
    Name = "AnsibleMaster"
  }
}

resource "aws_instance" "JenkinsMaster" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"

  tags {
    Name = "JenkinsMaster"
  }
}

resource "aws_security_group" "asnible_allow_all" {
  name        = "ansible_allow_all"
  description = "Allow all inbound traffic"
#  id 	      = "${var.security_group_id.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  }
}
