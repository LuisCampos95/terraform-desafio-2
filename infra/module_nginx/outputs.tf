# Output do IP da instância
output "public_ip" {
  value = "http://${aws_instance.this.public_ip}"
}

output "ssh_nginx" {
  value = "ssh ec2-user@${aws_instance.this.public_ip}"
}