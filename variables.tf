##ROUTE S3
variable "route53_zone_name" {
    type        = string
}

##BASE DE DATOS
variable "db_instance_allocated_storage" {
    type        = number
}

variable "db_instance_max_allocated_storage" {
    type        = number
}

variable "db_instance_engine" {
    type        = string
}

variable "db_instance_storage_type" {
    type        = string
}

variable "db_instance_engine_version" {
    type        = string
}

variable "db_instance_instance_class" {
    type        = string
}

variable "db_instance_name" {
    type        = string
}

variable "db_instance_username" {
    type        = string
}

variable "db_instance_password" {
    type        = string
}

variable "db_instance_parameter_group_name" {
    type        = string
}

variable "db_instance_multi_az" {
    type        = bool
}

##SECURITY GROUP

variable "security_group_name" {
    type        = string
}

variable "security_group_vpc_id" {
    type        = string
}

variable "security_group_ingress" {
    type        = list(map(string))
}

variable "security_group_egress" {
    type        = list(map(string))
}
variable vpc_id {
  type        = string
}


##APPLICATION LOAD BALANCING 
variable "alb_name" {
    type        = string
}

variable "alb_internal" {
    type        = bool
}

variable "alb_idle_timeout" {
    type        = number
}

variable "alb_idle_load_balancer_type" {
    type        = string
}

variable "alb_idle_enable_deletion_protection" {
    type        = bool
}

variable "alb_idle_enable_cross_zone_load_balancing" {
    type        = bool
}

variable "alb_target_group_name" {
    type        = string
}

variable "alb_target_group_port" {
    type        = number
}

variable "alb_target_group_protocol" {
    type        = string
}

variable "alb_target_group_stickiness_type" {
    type        = string
}

variable "alb_target_group_stickiness_cookie_duration" {
    type        = number
}

variable "alb_target_group_health_check_path" {
    type        = string
}

variable "alb_target_group_health_check_healthy_threshold" {
    type        = number
}

variable "alb_target_group_health_check_unhealthy_threshold" {
    type        = number
}

variable "alb_target_group_health_check_timeout" {
    type        = number
    default = 10
}

variable "alb_target_group_health_check_interval" {
    type        = number
}

variable "alb_target_group_health_check_matcher" {
    type        = string
}
variable "route53_record_name" {
    type        = string
    description = "route53 record name."
}
##
variable "route53_record_type" {
    type        = string
    description = "route53 record type."
}