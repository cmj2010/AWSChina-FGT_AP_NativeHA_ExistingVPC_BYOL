output "secgrp" {
  value = "${aws_security_group.secgrp.id}"
}

output "fgt_id" {
  value = "${aws_instance.fgt.id}"
}

output "fgt_port1_ip" {
  value = "${aws_network_interface.eni0.private_ip}"
}

output "fgt_port2_ip" {
  value = "${aws_network_interface.eni1.private_ip}"
}

output "fgt_port3_ip" {
  value = "${aws_network_interface.eni2.private_ip}"
}

output "fgt_port4_ip" {
  value = "${aws_network_interface.eni3.private_ip}"
}