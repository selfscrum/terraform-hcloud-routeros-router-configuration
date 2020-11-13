#
# terraform-hcloud-routeros-router-configuration/main.tf - 
#                               Uses a tf null resource to call an script on an existing router server
#                               -written by selfscrum. C 2020, MIT-Licence

resource "null_resource" "router_config" {
  provisioner "local-exec" {
      command = format("chmod +x %s/configure_router_standalone.sh ; %s/configure_router_standalone.sh %s %s %s %q", 
                        path.module,
                        path.module,
                        var.router_ip, 
                        var.router_user,
                        var.router_password,
                        join("^",var.router_commands)
                      )
  }
}
