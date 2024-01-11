data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "group-2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.group-2.id]
  key_name = aws_key_pair.project2.key_name
  user_data = <<-EOF
  $(file("apache.sh"))
  $(file("gitlabrunner.sh"))
EOF
  # count = 3
}