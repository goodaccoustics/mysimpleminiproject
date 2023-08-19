resource "aws_instance" "ec2" {
  ami           = "ami-0f34c5ae932e6f0e4"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  key_name = "justinlim-keypair-macbookair"
  associate_public_ip_address = "true"
  subnet_id = "subnet-0710a8aa03ea744aa"
  vpc_security_group_ids = ["sg-0c3f63d5afd6fa587"]

  tags = {
    Name = "justinlim-amazonlinux2023ami-t2.micro-mysimpleminiproject"
  }
}

resource "aws_instance" "ec2-ansibleserver" {
  ami           = "ami-0f34c5ae932e6f0e4"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  key_name = "justinlim-keypair-macbookair"
  associate_public_ip_address = "true"
  subnet_id = "subnet-0710a8aa03ea744aa"
  vpc_security_group_ids = ["sg-0c3f63d5afd6fa587"]
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install pip -y
    sudo python3 -m pip install --user ansible
  EOF

  tags = {
    Name = "justinlim-amazonlinux2023ami-t2.micro-mysimpleminiproject-ansibleserver"
  }
}