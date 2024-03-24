resource "aws_elastic_beanstalk_application" "application" {
  name        = var.elastic_beanstalk_application_name
  description = var.description
  tags = {
    createdby   = "terraform"
    module      = "terraform-aws-elasticbeanstalk"
    owner       = "Tayyab"
    Application = "aws-elasticbeanstalk-environment"
    Environment = "dev"
  }
}
