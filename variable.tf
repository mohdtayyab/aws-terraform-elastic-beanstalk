variable "region" {
  type        = string
  description = "AWS region"
}

variable "description" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk Application description"
}

variable "elastic_beanstalk_application_name" {
  type        = string
  description = "Elastic Beanstalk application name"
  default     = ""
}

variable "elastic_beanstalk_environment_name" {
  type        = string
  description = "Elastic Beanstalk application name"
  default     = ""
}
variable "environment_description" {
  type        = string
  default     = ""
  description = "Short description of the Environment"
}

variable "tier" {
  type        = string
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, 'WebServer' or 'Worker'"
}

variable "solution_stack_name" {
  type        = string
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html"
  default     = ""
}
variable "cooldown" {
  type        = number
  default     = 5
  description = "Cooldown periods help prevent Amazon EC2 Auto Scaling from initiating additional scaling activities before the effects of previous activities are visible. A cooldown period is the amount of time, in seconds, after a scaling activity completes before another scaling activity can start"

}

variable "wait_for_ready_timeout" {
  type        = string
  default     = "20m"
  description = "The maximum duration to wait for the Elastic Beanstalk Environment to be in a ready state before timing out"
}

# variable "version_label" {
#   type        = string
#   default     = ""
#   description = "Elastic Beanstalk Application version to deploy"
# } 
variable "loadbalancer_type" {
  type        = string
  default     = "application"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "loadbalancer_is_shared" {
  type        = bool
  default     = false
  description = "Loadbalam=ncer is share or not"
}
variable "http_listener_enabled" {
  type        = bool
  default     = true
  description = "Enable port 80 (http)"
}
variable "loadbalancer_managed_security_group" {
  type        = string
  default     = ""
  description = "Load balancer managed security group"
}

variable "healthcheck_url" {
  type        = string
  default     = "/"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

variable "healthcheck_httpcodes_to_match" {
  type        = list(string)
  default     = ["200"]
  description = "List of HTTP codes that indicate that an instance is healthy. Note that this option is only applicable to environments with a network or application load balancer"
}

variable "healthcheck_timeout" {
  type        = number
  default     = 5
  description = "The amount of time, in seconds, to wait for a response during a health check. Note that this option is only applicable to environments with an application load balancer"
}

variable "loadbalancer_subnets" {
  type        = list(string)
  description = "List of subnets to place Elastic Load Balancer"
  default     = ["subnet-047edb0ac1c8e553a", "subnet-08108090c82b7ff48"]
}

variable "application_port" {
  type        = number
  default     = 80
  description = "Port application is listening on"
}

variable "environment_type" {
  type        = string
  default     = "LoadBalanced"
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
}

variable "elb_scheme" {
  type        = string
  default     = "public"
  description = "Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC"
}

variable "healthcheck_interval" {
  type        = number
  default     = 10
  description = "The interval of time, in seconds, that Elastic Load Balancing checks the health of the Amazon EC2 instances of your application"
}

variable "healthcheck_healthy_threshold_count" {
  type        = number
  default     = 3
  description = "The number of consecutive successful requests before Elastic Load Balancing changes the instance health status"
}

variable "healthcheck_unhealthy_threshold_count" {
  type        = number
  default     = 3
  description = "The number of consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC in which to provision the AWS resources"
  default     = ""
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Whether to associate public IP addresses to the instances"
}

variable "application_subnets" {
  type        = list(string)
  description = "List of subnets to place EC2 instances"
  default     = []
}

variable "application_security_groups" {
  type        = string
  default     = ""
  description = "Define the security group"
}

variable "tags" {
  type = map(string)
  default = {
    "createdby"   = "terraform"
    "module"      = "terraform-aws-elasticbeanstalk"
    "owner"       = "Tayyab"
    "Environment" = "dev"
  }
}

variable "availability_zone_selector" {
  type        = string
  default     = "Any 2"
  description = "Availability Zone selector"
}

variable "base_host" {
  type        = string
  default     = ""
  description = "elastic beanstalk base host name"
}

variable "enhanced_reporting_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"
}

variable "managed_actions_enabled" {
  type        = bool
  default     = true
  description = "Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel`"
}

variable "autoscale_min" {
  type        = number
  default     = 2
  description = "Minumum instances to launch"
}

variable "autoscale_max" {
  type        = number
  default     = 4
  description = "Maximum instances to launch"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instances type"
}

variable "keypair" {
  type        = string
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
  default     = ""
}


variable "root_volume_size" {
  type        = number
  default     = 15
  description = "The size of the EBS root volume"
}

variable "root_volume_type" {
  type        = string
  default     = "gp2"
  description = "The type of the EBS root volume"
}

variable "root_volume_throughput" {
  type        = number
  default     = null
  description = "The type of the EBS root volume (only applies for gp3 type)"
}

variable "root_volume_iops" {
  type        = number
  default     = null
  description = "The IOPS of the EBS root volume (only applies for gp3 and io1 types)"
}

variable "ami_id" {
  type        = string
  default     = null
  description = "The id of the AMI to associate with the Amazon EC2 instances"
}

variable "deployment_batch_size_type" {
  type        = string
  default     = "Fixed"
  description = "The type of number that is specified in deployment_batch_size_type"
}

variable "deployment_batch_size" {
  type        = number
  default     = 1
  description = "Percentage or fixed number of Amazon EC2 instances in the Auto Scaling group on which to simultaneously perform deployments. Valid values vary per deployment_batch_size_type setting"
}

variable "deployment_ignore_health_check" {
  type        = bool
  default     = false
  description = "Do not cancel a deployment due to failed health checks"
}

variable "deployment_timeout" {
  type        = number
  default     = 600
  description = "Number of seconds to wait for an instance to complete executing commands"
}

variable "preferred_start_time" {
  type        = string
  default     = "Sun:10:00"
  description = "Configure a maintenance window for managed actions in UTC"
}

variable "update_level" {
  type        = string
  default     = "minor"
  description = "The highest level of update to apply with managed platform updates"
}
variable "instance_refresh_enabled" {
  type        = bool
  default     = true
  description = "Enable weekly instance replacement."
}

variable "autoscale_measure_name" {
  type        = string
  default     = "CPUUtilization"
  description = "Metric used for your Auto Scaling trigger"
}

variable "autoscale_statistic" {
  type        = string
  default     = "Average"
  description = "Statistic the trigger should use, such as Average"
}

variable "autoscale_unit" {
  type        = string
  default     = "Percent"
  description = "Unit for the trigger measurement, such as Bytes"
}

variable "autoscale_breach_duration" {
  type        = number
  default     = 5
  description = "The amount of time, in minutes, a metric can be beyond its defined limit (as specified in the UpperThreshold and LowerThreshold) before the trigger is invoked."
}
variable "autoscale_period" {
  type        = number
  default     = 5
  description = "Specifies how frequently Amazon CloudWatch measures the metrics for your trigger. The value is the number of minutes between two consecutive periods."

}
variable "autoscale_lower_bound" {
  type        = number
  default     = 30
  description = "Minimum level of autoscale metric to remove an instance"
}

variable "autoscale_lower_increment" {
  type        = number
  default     = -1
  description = "How many Amazon EC2 instances to remove when performing a scaling activity."
}

variable "autoscale_upper_bound" {
  type        = number
  default     = 80
  description = "Maximum level of autoscale metric to add an instance"
}

variable "autoscale_upper_increment" {
  type        = number
  default     = 1
  description = "How many Amazon EC2 instances to add when performing a scaling activity"
}
