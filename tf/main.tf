resource "aws_instance" "master_node" {
  ami           = "ami-0b61977be58df3188"
  instance_type = "t2.micro"
  count         = 3
  subnet_id = "subnet-06ae071fa4a2ed7b7"
  associate_public_ip_address = "${count.index == 0 ? "true" : 0 }"
  security_groups = ["sg-02dc9c1a4e7b1bf5a"]
  tags = {
    Name = "master-node-${count.index + 1}"
    uid = "k8s"
  }
}

resource "aws_instance" "worker_node" {
  ami           = "ami-0b61977be58df3188"
  instance_type = "t2.micro"
  count         = 2
  subnet_id = "subnet-06ae071fa4a2ed7b7"
  associate_public_ip_address = "false"
  security_groups = ["sg-02dc9c1a4e7b1bf5a"]

  tags = {
    Name = "worker-node-${count.index + 1}"
    uid = "k8s"
  }
}

