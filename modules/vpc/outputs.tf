output "terraformvpc_id" {
  value = aws_vpc.terraformvpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}

output "ha_subnet1_id" {
  value = aws_subnet.ha_subnet1.id
}

output "ha_subnet2_id" {
  value = aws_subnet.ha_subnet2.id
}

output "mgt_subnet1_id" {
  value = aws_subnet.mgt_subnet1.id
}

output "mgt_subnet2_id" {
  value = aws_subnet.mgt_subnet2.id
}

