terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "openstack"
  auth_url    = "http://controller:5000/v3"
  region      = "RegionOne"
}

# Create a server
resource "openstack_compute_instance_v2" "test-server" {
  name      = "instance-terraform"
  image_id = "f71331d7-a739-44f4-991c-390cabaa53b5"
  flavor_id = "1"
  key_pair  = "mykey"
  network {
    uuid = "a9485bcd-11bb-4cf8-b262-8b7a9f0448f8"
    name = "my-network"
  }
}
