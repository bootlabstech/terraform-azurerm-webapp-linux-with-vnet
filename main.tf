# Creates a Windows webapp
resource "azurerm_linux_web_app" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  https_only = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id

  lifecycle {
    ignore_changes = [
      app_settings,
      logs,
      sticky_settings,
      site_config[0].ip_restriction,
      site_config[0].application_stack[0].node_version,
      site_config[0].application_stack[0].docker,
      site_config[0].application_stack[0].dotnet,
      site_config[0].application_stack[0].python,
      site_config[0].application_stack[0].php,
      site_config[0].application_stack[0].java,
      site_config[0].application_stack[0].ruby,
      identity
    ]
  }

  site_config {
    ftps_state       = var.ftps_state
    vnet_route_all_enabled = var.vnet_route_all_enabled

    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "173.245.48.0/20" 
              name       = "cf1" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "103.21.244.0/22" 
              name       = "cf2" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "103.22.200.0/22" 
              name       = "cf3" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "103.31.4.0/22" 
              name       = "cf4" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "141.101.64.0/18" 
              name       = "cf5" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "108.162.192.0/18" 
              name       = "cf6" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "190.93.240.0/20" 
              name       = "cf7" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "188.114.96.0/20" 
              name       = "cf8" 
               priority   = 100
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "197.234.240.0/22" 
              name       = "cf9" 
               priority   = 100
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "198.41.128.0/17" 
              name       = "cf10" 
               priority   = 100
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "162.158.0.0/15" 
              name       = "cf11" 
               priority   = 100
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "104.16.0.0/13" 
              name       = "cf12" 
               priority   = 100
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "104.24.0.0/14" 
              name       = "cf13" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "172.64.0.0/13" 
              name       = "cf14" 
               priority   = 100 
    }
    ip_restriction {
       action     = "Allow" 
              headers    = [] 
              ip_address = "131.0.72.0/22" 
              name       = "cf15" 
               priority   = 100
    }
    
    app_command_line = var.app_command_line
    dynamic "application_stack" {
      for_each = var.current_stack == "docker" ? [1] : []
      content {
        docker_image_name        = var.stack_version
        docker_registry_url      = var.docker_registry_url
        docker_registry_username = var.docker_registry_username
        docker_registry_password = var.docker_registry_password
      }
    }
    dynamic "application_stack" {
      for_each = var.current_stack == "dotnet" ? [1] : []
      content {
        dotnet_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.current_stack == "node" ? [1] : []
      content {
        node_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.current_stack == "java" ? [1] : []
      content {
        java_version                 = var.stack_version
        java_server_version  = var.java_server_version
        java_server = var.java_server

      }
    }
    dynamic "application_stack" {
      for_each = var.current_stack == "php" ? [1] : []
      content {
        php_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.current_stack == "python" ? [1] : []
      content {
        python_version = var.stack_version
      }
    }
    dynamic "application_stack" {
      for_each = var.current_stack == "ruby" ? [1] : []
      content {
        ruby_version = var.stack_version
      }
    }
  }

}