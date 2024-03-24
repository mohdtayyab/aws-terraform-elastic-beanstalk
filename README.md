# AWS Elastic Beanstalk Terraform Project

This Terraform project aims to provision and manage AWS Elastic Beanstalk environments using infrastructure as code.

## Overview

AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

This project demonstrates how to define and deploy Elastic Beanstalk environments using Terraform, allowing for consistent infrastructure provisioning and management.


<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.5.1 |

## Prerequisites

Before you can use Terraform to manage your Elastic Beanstalk environments, ensure you have the following prerequisites:

- AWS account and access keys with necessary permissions.
- Terraform installed (installation instructions can be found [here](https://learn.hashicorp.com/tutorials/terraform/install-cli)).
- AWS CLI installed and configured with credentials (installation instructions can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)).


## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/mohdtayyab/aws-terraform-elastic-beanstalk
    ```

2. Navigate to the project directory:

    ```bash
    cd aws-terraform-elastic-beanstalk
    ```

3. Initialize Terraform in the project directory:

    ```bash
    terraform init
    ```
### Making Changes

1. make edits to `terraform.tfvars`. You shouldn't need to edit other files unless necessary
2. run `validate` to ensure all files are valid
3. run `plan` to see how your changes will look
4. run `format` to take care of syntax formatting
5. run `apply` to take care of syntax formatting

For detailed usage and options of each command, you can refer to the [Terraform documentation](https://www.terraform.io/docs/).


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The id of the AMI to associate with the Amazon EC2 instances | `string` | `null` | no |
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port application is listening on | `number` | `80` | no |
| <a name="input_application_subnets"></a> [application\_subnets](#input\_application\_subnets) | List of subnets to place EC2 instances | `list(string)` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate public IP addresses to the instances | `bool` | `false` | no |
| <a name="input_associated_security_group_ids"></a> [associated\_security\_group\_ids](#input\_associated\_security\_group\_ids) | A list of IDs of Security Groups to associate the created resource with, in addition to the created security group.<br>These security groups will not be modified and, if `create_security_group` is `false`, must have rules providing the desired access. | `list(string)` | `[]` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_autoscale_lower_bound"></a> [autoscale\_lower\_bound](#input\_autoscale\_lower\_bound) | Minimum level of autoscale metric to remove an instance | `number` | `20` | no |
| <a name="input_autoscale_lower_increment"></a> [autoscale\_lower\_increment](#input\_autoscale\_lower\_increment) | How many Amazon EC2 instances to remove when performing a scaling activity. | `number` | `-1` | no |
| <a name="input_autoscale_max"></a> [autoscale\_max](#input\_autoscale\_max) | Maximum instances to launch | `number` | `3` | no |
| <a name="input_autoscale_measure_name"></a> [autoscale\_measure\_name](#input\_autoscale\_measure\_name) | Metric used for your Auto Scaling trigger | `string` | `"CPUUtilization"` | no |
| <a name="input_autoscale_min"></a> [autoscale\_min](#input\_autoscale\_min) | Minumum instances to launch | `number` | `2` | no |
| <a name="input_autoscale_statistic"></a> [autoscale\_statistic](#input\_autoscale\_statistic) | Statistic the trigger should use, such as Average | `string` | `"Average"` | no |
| <a name="input_autoscale_unit"></a> [autoscale\_unit](#input\_autoscale\_unit) | Unit for the trigger measurement, such as Bytes | `string` | `"Percent"` | no |
| <a name="input_autoscale_upper_bound"></a> [autoscale\_upper\_bound](#input\_autoscale\_upper\_bound) | Maximum level of autoscale metric to add an instance | `number` | `80` | no |
| <a name="input_autoscale_upper_increment"></a> [autoscale\_upper\_increment](#input\_autoscale\_upper\_increment) | How many Amazon EC2 instances to add when performing a scaling activity | `number` | `1` | no |
| <a name="input_availability_zone_selector"></a> [availability\_zone\_selector](#input\_availability\_zone\_selector) | Availability Zone selector | `string` | `"Any 2"` | no |
| <a name="input_healthcheck_healthy_threshold_count"></a> [healthcheck\_healthy\_threshold\_count](#input\_healthcheck\_healthy\_threshold\_count) | The number of consecutive successful requests before Elastic Load Balancing changes the instance health status | `number` | `3` | no |
| <a name="input_healthcheck_httpcodes_to_match"></a> [healthcheck\_httpcodes\_to\_match](#input\_healthcheck\_httpcodes\_to\_match) | List of HTTP codes that indicate that an instance is healthy. Note that this option is only applicable to environments with a network or application load balancer | `list(string)` | <pre>[<br>  "200"<br>]</pre> | no |
| <a name="input_healthcheck_interval"></a> [healthcheck\_interval](#input\_healthcheck\_interval) | The interval of time, in seconds, that Elastic Load Balancing checks the health of the Amazon EC2 instances of your application | `number` | `10` | no |
| <a name="input_healthcheck_timeout"></a> [healthcheck\_timeout](#input\_healthcheck\_timeout) | The amount of time, in seconds, to wait for a response during a health check. Note that this option is only applicable to environments with an application load balancer | `number` | `5` | no |
| <a name="input_healthcheck_unhealthy_threshold_count"></a> [healthcheck\_unhealthy\_threshold\_count](#input\_healthcheck\_unhealthy\_threshold\_count) | The number of consecutive unsuccessful requests before Elastic Load Balancing changes the instance health status | `number` | `3` | no |
| <a name="input_healthcheck_url"></a> [healthcheck\_url](#input\_healthcheck\_url) | Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances | `string` | `"/"` | no |
| <a name="input_http_listener_enabled"></a> [http\_listener\_enabled](#input\_http\_listener\_enabled) | Enable port 80 (http) | `bool` | `true` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instances type | `string` | `"t2.micro"` | no |
| <a name="input_keypair"></a> [keypair](#input\_keypair) | Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS | `string` | `""` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_loadbalancer_connection_idle_timeout"></a> [loadbalancer\_connection\_idle\_timeout](#input\_loadbalancer\_connection\_idle\_timeout) | Classic load balancer only: Number of seconds that the load balancer waits for any data to be sent or received over the connection. If no data has been sent or received after this time period elapses, the load balancer closes the connection. | `number` | `60` | no |
| <a name="input_loadbalancer_crosszone"></a> [loadbalancer\_crosszone](#input\_loadbalancer\_crosszone) | Configure the classic load balancer to route traffic evenly across all instances in all Availability Zones rather than only within each zone. | `bool` | `true` | no |
| <a name="input_loadbalancer_is_shared"></a> [loadbalancer\_is\_shared](#input\_loadbalancer\_is\_shared) | Flag to create a shared application loadbalancer. Only when loadbalancer\_type = "application" https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environments-cfg-alb-shared.html | `bool` | `false` | no |
| <a name="input_loadbalancer_managed_security_group"></a> [loadbalancer\_managed\_security\_group](#input\_loadbalancer\_managed\_security\_group) | Load balancer managed security group | `string` | `""` | no |
| <a name="input_loadbalancer_subnets"></a> [loadbalancer\_subnets](#input\_loadbalancer\_subnets) | List of subnets to place Elastic Load Balancer | `list(string)` | `[]` | no |
| <a name="input_loadbalancer_type"></a> [loadbalancer\_type](#input\_loadbalancer\_type) | Load Balancer type, e.g. 'application' or 'classic' | `string` | `"classic"` | no |
| <a name="input_preferred_start_time"></a> [preferred\_start\_time](#input\_preferred\_start\_time) | Configure a maintenance window for managed actions in UTC | `string` | `"Sun:10:00"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_rolling_update_enabled"></a> [rolling\_update\_enabled](#input\_rolling\_update\_enabled) | Whether to enable rolling update | `bool` | `true` | no |
| <a name="input_rolling_update_type"></a> [rolling\_update\_type](#input\_rolling\_update\_type) | `Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances | `string` | `"Health"` | no |
| <a name="input_root_volume_iops"></a> [root\_volume\_iops](#input\_root\_volume\_iops) | The IOPS of the EBS root volume (only applies for gp3 and io1 types) | `number` | `null` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the EBS root volume | `number` | `8` | no |
| <a name="input_root_volume_throughput"></a> [root\_volume\_throughput](#input\_root\_volume\_throughput) | The type of the EBS root volume (only applies for gp3 type) | `number` | `null` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | The type of the EBS root volume | `string` | `"gp2"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC in which to provision the AWS resources | `string` | n/a | yes |
| <a name="input_wait_for_ready_timeout"></a> [wait\_for\_ready\_timeout](#input\_wait\_for\_ready\_timeout) | The maximum duration to wait for the Elastic Beanstalk Environment to be in a ready state before timing out | `string` | `"20m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_settings"></a> [all\_settings](#output\_all\_settings) | List of all option settings configured in the environment. These are a combination of default settings and their overrides from setting in the configuration |
| <a name="output_application"></a> [application](#output\_application) | The Elastic Beanstalk Application for this environment |
| <a name="output_ec2_instance_profile_role_name"></a> [ec2\_instance\_profile\_role\_name](#output\_ec2\_instance\_profile\_role\_name) | Instance IAM role name |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Fully qualified DNS name for the environment |
| <a name="output_id"></a> [id](#output\_id) | ID of the Elastic Beanstalk environment |
| <a name="output_instances"></a> [instances](#output\_instances) | Instances used by this environment |
| <a name="output_launch_configurations"></a> [launch\_configurations](#output\_launch\_configurations) | Launch configurations in use by this environment |
| <a name="output_load_balancer_log_bucket"></a> [load\_balancer\_log\_bucket](#output\_load\_balancer\_log\_bucket) | Name of bucket where Load Balancer logs are stored (if enabled) |
| <a name="output_load_balancers"></a> [load\_balancers](#output\_load\_balancers) | Elastic Load Balancers in use by this environment |
| <a name="output_name"></a> [name](#output\_name) | Name of the Elastic Beanstalk environment |
| <a name="output_queues"></a> [queues](#output\_queues) | SQS queues in use by this environment |
| <a name="output_setting"></a> [setting](#output\_setting) | Settings specifically set for this environment |
| <a name="output_tier"></a> [tier](#output\_tier) | The environment tier |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Autoscaling triggers in use by this environment |
<!-- markdownlint-restore -->

