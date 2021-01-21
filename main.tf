provider "aws" {
    access_key = ""
    secret_key = ""
    region     = "us-west-1"
}

##route 53
resource "aws_route53_zone" "route53_zone_terraform" {
    name       = var.route53_zone_name
}