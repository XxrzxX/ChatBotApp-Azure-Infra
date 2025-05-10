data "external" "device_ip" {
  program = ["bash", "${path.module}/Setup_Scripts/get_device_ip.sh"]
}

