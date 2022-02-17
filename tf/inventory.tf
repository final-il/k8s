# data  "template_file" "k8s" {
#     template = "${file("./templates/inventory.tpl")}"
#     vars {
#         master = "${join("\n", aws_instance.master_node.*.private_ip)}"
#         worker = "${join("\n", aws_instance.worker_node.*.private_ip)}"
#     }
# }

resource "local_file" "ansible_inventory" {
      content = templatefile("./templates/inventory.tpl", {
      master_ip = "${aws_instance.master_node.*.private_ip}"
      worker_ip = "${aws_instance.worker_node.*.private_ip}"
      master_name = "${aws_instance.master_node.*.tags.Name}"
      worker_name = "${aws_instance.worker_node.*.tags.Name}"
      } ) 
      filename = "./inventory/hosts.ini"
    }