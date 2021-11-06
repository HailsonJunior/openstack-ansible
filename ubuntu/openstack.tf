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
  auth_url    = "http://controller:5000/v2.0"
  region      = "RegionOne"
}

# Create a server
resource "openstack_compute_instance_v2" "test-server" {
    name = "cirros_os"
    image_id = ""
    flavor_id = ""
    network {
        name = ""
    }
}