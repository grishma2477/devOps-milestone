# AWS -------------------------------------

locals {
  aws_instance_type = "t3.micro"
  aws_username = "ec2-user"
  aws_key_name = "aws_key"
}

# GCP ---------------------------------

locals {
    gcp_instance_type = "e2-micro"
    gcp_project_id = "milestone-3-498908"
    gcp_username = "grishma"
    gcp_key_name = "gcp_key"
}