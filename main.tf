resource "aws_elastic_beanstalk_environment" "default" {
  name                    = var.env_name
  application             = var.app_name
  solution_stack_name     = var.solution_stack
  wait_for_ready_timeout  = var.timeout
### ENVIRONMENT SETTINGS  ###
  dynamic setting {
    for_each = var.env_settings
    content {
      namespace = setting.value[0]
      name      = setting.value[1]
      value     = setting.value[2]
    }
  }
}

