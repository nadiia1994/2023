
resource "aws_instance" "group-2" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.medium"
  availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.group-2.id]
  key_name = aws_key_pair.project2.key_name
  user_data = file("apache.sh")
  # count = 3
  tags = {
    Name = "group-2"
  }
}

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    always_run = "${timestamp()}"
  }
  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = element(aws_instance.group-2[*].public_ip, 0)
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }
  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
        "sudo apt-get update"
        "sudo apt-get install -y curl"
        "curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash"
        "sudo apt-get install gitlab-runner -y"

]
  }
}