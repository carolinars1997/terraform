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