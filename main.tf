resource "aws_instance" "ec2" {
  ami           = "ami-08a52ddb321b32a8c"  # Amazon Linux 2 LTS
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
  ami           = "ami-08a52ddb321b32a8c"  # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  key_name = "justinlim-keypair-macbookair"
  associate_public_ip_address = "true"
  subnet_id = "subnet-044b09d27aa26415c"
  vpc_security_group_ids = ["sg-0c3f63d5afd6fa587"]
  user_data = <<EOF
    #!/bin/bash
    echo "sudo yum update -y"
    sudo yum update -y
    echo "sudo yum install pip -y"
    sudo yum install pip -y
    echo "sudo python3 -m pip install --user ansible"
    sudo python3 -m pip install --user ansible
  EOF

  tags = {
    Name = "justinlim-amazonlinux2023ami-t2.micro-mysimpleminiproject-ansibleserver"
  }
}