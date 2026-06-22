output "nginx_public_ip" {
  value = aws_instance.nginx-server.public_ip
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins-server.public_ip
}

output "apache_public_ip" {
  value = aws_instance.apache-server.public_ip
}