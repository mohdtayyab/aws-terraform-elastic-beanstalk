
output "elastic_beanstalk_environment_id" {
  description = "ID of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.id
}

output "elastic_beanstalk_environment_name" {
  value       = module.elastic_beanstalk.name
  description = "Name"
}


output "elastic_beanstalk_environment_endpoint_url" {
  value       = module.elastic_beanstalk.endpoint_url
  description = "Name"
}

output "elastic_beanstalk_environment_tier" {
  description = "The environment tier"
  value       = module.elastic_beanstalk.tier
}

output "elastic_beanstalk_environment_application" {
  description = "The Elastic Beanstalk Application specified for this environment"
  value       = module.elastic_beanstalk.application
}

output "elastic_beanstalk_environment_setting" {
  description = "Settings specifically set for this environment"
  value       = module.elastic_beanstalk.setting
}

output "elastic_beanstalk_environment_all_settings" {
  description = "List of all option settings configured in the environment. These are a combination of default settings and their overrides from setting in the configuration"
  value       = module.elastic_beanstalk.all_settings
}

output "elastic_beanstalk_environment_endpoint" {
  description = "Fully qualified DNS name for the environment"
  value       = module.elastic_beanstalk.endpoint
}

output "elastic_beanstalk_environment_autoscaling_groups" {
  description = "The autoscaling groups used by this environment"
  value       = module.elastic_beanstalk.autoscaling_groups
}

output "elastic_beanstalk_environment_instances" {
  description = "Instances used by this environment"
  value       = module.elastic_beanstalk.instances
}

output "elastic_beanstalk_environment_launch_configurations" {
  description = "Launch configurations in use by this environment"
  value       = module.elastic_beanstalk.launch_configurations
}

output "elastic_beanstalk_environment_load_balancers" {
  description = "Elastic Load Balancers in use by this environment"
  value       = module.elastic_beanstalk.load_balancers
}

output "elastic_beanstalk_environment_queues" {
  description = "SQS queues in use by this environment"
  value       = module.elastic_beanstalk.queues
}

output "elastic_beanstalk_environment_triggers" {
  description = "Autoscaling triggers in use by this environment"
  value       = module.elastic_beanstalk.triggers
}