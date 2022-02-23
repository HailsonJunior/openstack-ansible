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
  image_id  = "968bf1bc-6466-493c-8e8a-c6b3c0200768"
  flavor_id = "0"
  key_pair  = "mykey"
  network {
    uuid = "b63bba2e-f184-4fc5-a088-53268cef7b79"
    name = "my-network"
  }
}
