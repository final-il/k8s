output "master_ip" {
  description = "internal IP address of the EC2 instance"
  value       = [ "${aws_instance.master_node.*.private_ip}" ]
}

output "master_public_ip" {
  description = "public IP address of the EC2 instance"
  value       = [ "${aws_instance.master_node.*.public_ip}" ]
}

output "master_name" {
  description = "master name"
  value       = [ "${aws_instance.master_node.*.tags.Name}" ]
}

output "worker_ip" {
  description = "internal IP address of the EC2 instance"
  value       = [ "${aws_instance.worker_node.*.private_ip}" ]
}

output "worker_name" {
  description = "worker name"
  value       = [ "${aws_instance.worker_node.*.tags.Name}" ]
}