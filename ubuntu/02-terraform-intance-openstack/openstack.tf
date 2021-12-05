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
  image_id  = "527bcb67-a50d-4736-bad4-3194def078cb"
  flavor_id = "1"
  key_pair  = "mykey"
  network {
    uuid = "f189d523-ae5c-490a-82dc-adb336c3a208"
    name = "private-network"
  }
}
