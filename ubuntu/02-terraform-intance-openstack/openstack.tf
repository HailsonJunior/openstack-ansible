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
  image_id  = "d6ad1591-2231-4c16-a51f-ea4751769929"
  flavor_id = "0"
  key_pair  = "mykey"
  network {
    uuid = "14dec4ad-421f-430c-b558-98c2a7999be1"
    name = "my-network"
  }
}
