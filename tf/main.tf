resource "aws_instance" "master_node" {
  ami           = "ami-0848c3f903457a484"
  instance_type = "t2.micro"
  count         = 3
  subnet_id = "subnet-01df9070f1a32d9e9"
  associate_public_ip_address = "true"
  tags = {
    Name = "master-node-${count.index + 1}"
    uid = "k8s"
  }
}

resource "aws_instance" "worker_node" {
  ami           = "ami-0848c3f903457a484"
  instance_type = "t2.micro"
  count         = 2
  subnet_id = "subnet-01df9070f1a32d9e9"
  associate_public_ip_address = "true"

  tags = {
    Name = "worker-node-${count.index + 1}"
    uid = "k8s"
  }
}

