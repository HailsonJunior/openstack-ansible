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
  image_id  = "7ed31b94-f5f6-4fa9-a370-3e664db71c4b"
  flavor_id = "2"
  key_pair  = "mykey"
  network {
    uuid = "40d4b0ee-6670-4fe8-823a-e18aef4deb75"
    name = "my-network"
  }
}
