output "AWS_SSH_Command" {
  value = "ssh -i ~/.ssh/${local.aws_key_name} ${local.aws_username}@${aws_instance.docker_server.public_ip}"
}

output "GCP_SSH_Command" {
  value = "ssh -i ~/.ssh/${local.gcp_key_name} ${local.gcp_username}@${google_compute_instance.jenkins.network_interface[0].access_config[0].nat_ip}"
}