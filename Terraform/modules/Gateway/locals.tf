# local variables for Azure Application Gateway
locals {
  backend_address_pool_name      = "VMSS_Backend_Pool"
  frontend_port_name             = "${var.VnetName}-FrontendPort"
  frontend_ip_configuration_name = "${var.VnetName}-FrontendIPConf"
  http_setting_name              = "${var.VnetName}-BackendHTTPSeT"
  listener_name                  = "${var.VnetName}-HTTPL"
  request_routing_rule_name      = "${var.VnetName}-RequestRRule"
  redirect_configuration_name    = "${var.VnetName}-RedConf"
}
