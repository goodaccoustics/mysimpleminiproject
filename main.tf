terraform {
  backend "s3" {
    bucket = "sctp-ce3-tfstate-bucket"
    key = "justinlim.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  key_name = "justinlim-keypair-macbookair"
  associate_public_ip_address = "true"
  subnet_id = "subnet-044b09d27aa26415c"
  vpc_security_group_ids = ["sg-0c3f63d5afd6fa587"]

  tags = {
    Name = "justinlim-amazonlinux2023ami-t2.micro-mysimpleminiproject"
  }
}

resource "aws_instance" "ec2-ansibleserver" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  key_name = "justinlim-keypair-macbookair"
  associate_public_ip_address = "true"
  subnet_id = "subnet-044b09d27aa26415c"
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
