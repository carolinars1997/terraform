#R53
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
## APPLICATION LOAD BALANCER
alb_name = "wordpress"
alb_internal = false
alb_idle_timeout = 60
alb_idle_load_balancer_type = "application"
alb_idle_enable_deletion_protection = false
alb_idle_enable_cross_zone_load_balancing = true
alb_target_group_name = "wordpress"
alb_target_group_port = 80
alb_target_group_protocol = "HTTP"
alb_target_group_stickiness_type = "lb_cookie"
alb_target_group_stickiness_cookie_duration = 86400
alb_target_group_health_check_path = "/wordpress/login"
alb_target_group_health_check_healthy_threshold = 2
alb_target_group_health_check_unhealthy_threshold = 2
alb_target_group_health_check_timeout = 10
alb_target_group_health_check_interval = 30
alb_target_group_health_check_matcher = "200,301,302"
route53_record_name = "www"
route53_record_type = "A"
#AUTO SCALING
route53_record_alias_evaluate_target_health =  true
launch_template_name_prefix = "wordpress"
launch_template_image_id = "ami-03130878b60947df3" 
launch_template_instance_type = "t2.medium"
autoscaling_group_desired_capacity = 2
autoscaling_group_max_size = 2
autoscaling_group_min_size = 2
autoscaling_group_launch_template_version = "$Latest"
