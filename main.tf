provider "aws" {
    access_key = ""
    secret_key = ""
    region     = "us-west-1"
}

##route 53
resource "aws_route53_zone" "route53_zone_terraform" {
    name       = var.route53_zone_name
}
##BASE DE DATOS
resource "aws_db_instance" "db_instance_terraform" {
    allocated_storage     = var.db_instance_allocated_storage
    max_allocated_storage = var.db_instance_max_allocated_storage
    storage_type          = var.db_instance_storage_type
    engine                = var.db_instance_engine
    engine_version        = var.db_instance_engine_version
    instance_class        = var.db_instance_instance_class
    name                  = var.db_instance_name
    username              = var.db_instance_username
    password              = var.db_instance_password
    parameter_group_name  = var.db_instance_parameter_group_name
    multi_az              = var.db_instance_multi_az
    
}
##SECURITY GROUP
resource "aws_security_group" "security_group_terraform" {
    name       = var.security_group_name
    vpc_id     = var.security_group_vpc_id
    dynamic "ingress" {
        for_each = [ for i in  var.security_group_ingress: {
            from_port   = i.from_port
            to_port     = i.to_port
            protocol    = i.protocol
            cidr_blocks = i.cidr_blocks
        }]

        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = split(",", ingress.value.cidr_blocks)
        }
    }
    dynamic "egress" {
        for_each = [ for e in  var.security_group_egress: {
            from_port   = e.from_port
            to_port     = e.to_port
            protocol    = e.protocol
            cidr_blocks = e.cidr_blocks
        }]

        content {
            from_port   = egress.value.from_port
            to_port     = egress.value.to_port
            protocol    = egress.value.protocol
            cidr_blocks = split(",", egress.value.cidr_blocks)
        }
    }
}