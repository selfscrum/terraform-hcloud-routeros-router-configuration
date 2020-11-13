#
# terraform-hcloud-routeros-router-configuration/variables.tf - 
#                               input declarations for the terraform-hcloud-routeros-router module
#                               -written by selfscrum. C 2020, MIT-Licence
#
#

variable "system_name"  { 
    description = "System name, used as part of the router name"
}

variable "system_stage" { 
    description = "System stage, used as part of the router name"
}

variable "router_ip" {
    description = "Router IP address"
}

variable "router_user" {
    description = "Name of the router's admin user"
}

variable "router_password" {
    description = "Password of the admin user"
}

variable "router_commands" {
    description = "List of routos commands for the router"
    type = list(string)
    default = []
}