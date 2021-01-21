route53_zone_name = "wordpress2021-prueba.com"
##RDS
db_instance_allocated_storage = 50
db_instance_max_allocated_storage = 100
db_instance_storage_type = "gp2"
db_instance_engine = "mysql"
db_instance_engine_version = "5.7"
db_instance_instance_class = "db.t2.micro"
db_instance_name = "wordpress"
db_instance_username = "wordpress"
db_instance_password = "wordpress225346564789680r"
db_instance_parameter_group_name = "default.mysql5.7"
db_instance_multi_az = true
##SECURITY GROUP    
security_group_name = " ingress http"
security_group_vpc_id = "vpc-e8d51e8e"
security_group_ingress = [{from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = "0.0.0.0/0"}]
security_group_egress = [{from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = "0.0.0.0/0"}]
vpc_id = "vpc-e8d51e8e"