module "elastic_beanstalk" {
  source = "./module/elastic-beanstalk"


  region                             = var.region
  elastic_beanstalk_application_name = var.elastic_beanstalk_application_name
  description                        = var.description
  elastic_beanstalk_environment_name = var.elastic_beanstalk_environment_name
  environment_description            = var.environment_description
  solution_stack_name                = var.solution_stack_name
  tier                               = var.tier
  wait_for_ready_timeout             = var.wait_for_ready_timeout
  # version_label = var.version_label
  loadbalancer_type                     = var.loadbalancer_type
  loadbalancer_is_shared                = var.loadbalancer_is_shared
  loadbalancer_managed_security_group   = var.loadbalancer_managed_security_group
  healthcheck_url                       = var.healthcheck_url
  loadbalancer_subnets                  = var.loadbalancer_subnets
  application_port                      = var.application_port
  environment_type                      = var.environment_type
  elb_scheme                            = var.elb_scheme
  healthcheck_interval                  = var.healthcheck_interval
  healthcheck_healthy_threshold_count   = var.healthcheck_healthy_threshold_count
  healthcheck_unhealthy_threshold_count = var.healthcheck_unhealthy_threshold_count
  vpc_id                                = var.vpc_id
  associate_public_ip_address           = var.associate_public_ip_address
  application_subnets                   = var.application_subnets
  availability_zone_selector            = var.availability_zone_selector
  base_host                             = var.base_host
  enhanced_reporting_enabled            = var.enhanced_reporting_enabled
  managed_actions_enabled               = var.managed_actions_enabled
  autoscale_min                         = var.autoscale_min
  autoscale_max                         = var.autoscale_max
  instance_type                         = var.instance_type
  keypair                               = var.keypair
  root_volume_size                      = var.root_volume_size
  root_volume_type                      = var.root_volume_type
  ami_id                                = var.ami_id
  autoscale_measure_name                = var.autoscale_measure_name
  autoscale_statistic                   = var.autoscale_statistic
  autoscale_unit                        = var.autoscale_unit
  autoscale_lower_bound                 = var.autoscale_lower_bound
  autoscale_lower_increment             = var.autoscale_lower_increment
  autoscale_upper_bound                 = var.autoscale_upper_bound
  autoscale_upper_increment             = var.autoscale_upper_increment
  autoscale_breach_duration             = var.autoscale_breach_duration
  autoscale_period                      = var.autoscale_period
  cooldown                              = var.cooldown

}
