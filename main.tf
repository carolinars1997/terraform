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
data "aws_subnet_ids" "subnet_ids_terraform" {
    vpc_id = var.vpc_id
}

##APLICATION LOAD BALANCER ALB
resource "aws_lb" "alb_terraform" {
    name                             = var.alb_name
    internal                         = var.alb_internal
    idle_timeout                     = var.alb_idle_timeout
    load_balancer_type               = var.alb_idle_load_balancer_type
    security_groups                  = [aws_security_group.security_group_terraform.id]
    subnets                          = data.aws_subnet_ids.subnet_ids_terraform.ids
    enable_deletion_protection       = var.alb_idle_enable_deletion_protection
    enable_cross_zone_load_balancing = var.alb_idle_enable_cross_zone_load_balancing
}

resource "aws_alb_target_group" "alb_target_group_terraform" {
    name                    = var.alb_target_group_name
    port                    = var.alb_target_group_port
    protocol                = var.alb_target_group_protocol
    vpc_id                  = var.vpc_id
    stickiness {
        type                = var.alb_target_group_stickiness_type
        cookie_duration     = var.alb_target_group_stickiness_cookie_duration
    }
    health_check {
        path                = var.alb_target_group_health_check_path
        healthy_threshold   = var.alb_target_group_health_check_healthy_threshold
        unhealthy_threshold = var.alb_target_group_health_check_unhealthy_threshold
        timeout             = var.alb_target_group_health_check_timeout
        interval            = var.alb_target_group_health_check_interval
        matcher             = var.alb_target_group_health_check_matcher
        protocol            = var.alb_target_group_protocol
    }
}

resource "aws_route53_record" "www" {
    zone_id                    = aws_route53_zone.route53_zone_terraform.zone_id
    name                       = var.route53_record_name
    type                       = var.route53_record_type
    alias {
    name                   = aws_lb.alb_terraform.dns_name
    zone_id                = aws_lb.alb_terraform.zone_id
    evaluate_target_health = true
  }

}