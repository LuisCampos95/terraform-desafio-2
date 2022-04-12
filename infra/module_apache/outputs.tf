# Output do IP da instância
output "public_ip" {
  value = "http://${aws_instance.this.public_ip}"
}

# Output do IP da instância
output "private_ip" {
  value = "http://${aws_instance.this.private_ip}"
}

output "ssh_apache" {
  value = "ssh ec2-user@${aws_instance.this.private_ip}"
}