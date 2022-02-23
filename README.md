# OpenStack-Ansible

OpenStack-Ansible is a project to deploy OpenStack with Ansible in a way that makes it more simple, secure and fast than a manual process.

With this project OpenStack is deployed using 4 nodes (controller, compute, block storage and object storage). For more details of how the environemnt is configured, see the [OpenStack Installation Guide](https://docs.openstack.org/install-guide/).

Getting started
------------
To use this project, first use it in a test environment before try in production, then adjust what is needed according to your environment. For a test environemnt this repository contains terraform files to create 4 instances on AWS.

Test environment
------------

On a Linux machine install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) and [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu) (I recomend to use a t2.micro machine on AWS for execute Ansible playbooks more fast). On this machine you need to proceed with the following steps using a user called ```ubuntu```:

1. Set AWS environment variables (or you can configure using [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))

```sh
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```
2. Init and execute Terraform apply

```bash
git clone https://github.com/HailsonJunior/openstack-ansible.git

cd openstack-ansible/ubuntu/00-Creating-HostsAWS-opcional/

terraform init

terraform apply
```
The resources will be created on AWS us-east-2 region.

3. Exchange key using ssh command with all machines that has been created. If you have executed Terraform from a machine in a diferent network from the created machines, you need to ssh using public IP.

```bash
ssh INTANCE_IP_01
ssh INTANCE_IP_02
ssh INTANCE_IP_03
ssh INTANCE_IP_04
```

Deploy OpenStack
------------

1. Acces deploy Ansible directory

```bash
cd ../01-deploy-openstack/
```
2. Adjust the following files according to your environment, using the correct IPs adddress, device interface name, device volume name, etc. If you are using the Terraform files from this project to a test environment on AWS, will just be needed to adjust the ```inventory.ini``` file with the public IP of the instances.

- inventory.ini

```bash
[controller]
node1 ansible_host=3.85.164.8

[compute]
node2 ansible_host=54.145.68.249

[block]
node3 ansible_host=44.201.108.97

[object]
node4 ansible_host=44.202.168.189
```

- roles/prepare-environment/defaults/main.yml

```bash
---
## Nodes IPs
ip_controller: 172.31.82.248
ip_compute: 172.31.87.49
ip_block: 172.31.91.50
ip_object: 172.31.82.229

## Network 
network: 172.31.0.0/16

## NTP Server
NTP_SERVER: YOUR_NTP_SERVER

## Passwords
db_root_pass: openstack
RABBIT_PASS: openstack
```
- roles/keystone/defaults/main.yml

```bash
---
## Nodes IPs
ip_controller: 172.31.82.248

## Passwords
db_root_pass: openstack
KEYSTONE_DBPASS: openstack
bootstrap_pass: openstack
myuser_pass: openstack
```
- roles/horizon/defaults/main.yml

```bash
---
#Time zone
TIME_ZONE: UTC
```
- roles/glance/defaults/main.yml

```bash
---
# Database root password
db_root_pass: openstack
GLANCE_DBPASS: openstack

# Openstack glance user password
GLANCE_PASS: openstack
```
- roles/placement/defaults/main.yml

```bash
---
# Database passwords
db_root_pass: openstack
PLACEMENT_DBPASS: openstack

# Placement password
PLACEMENT_PASS: openstack
```
- roles/nova/defaults/main.yml

```bash
---
# Databases passwords
db_root_pass: openstack
NOVA_DBPASS: openstack

# Other passwords
NOVA_PASS: openstack
RABBIT_PASS: openstack
PLACEMENT_PASS: openstack

# Nodes iPs
ip_controller: 172.31.82.248
ip_compute: 172.31.87.49
...
```
- roles/neutron/defaults/main.yml

```bash
---
# Databases Pass
db_root_pass: openstack
NEUTRON_DBPASS: openstack

# Other passwords
NEUTRON_PASS: openstack
NOVA_PASS: openstack
RABBIT_PASS: openstack
METADATA_SECRET: openstack

# Physical interface mappings
PROVIDER_INTERFACE_NAME: eth0

# IP nodes
ip_controller: 172.31.82.248
ip_compute: 172.31.87.49

# Network
network: 172.31.0.0

# VLAN_ID
MIN_VLAN_ID: 1001
MAX_VLAN_ID: 2000

# L3 scheduler
OVN_L3_SCHEDULER: chance

...
```
- roles/cinder/defaults/main.yml

```bash
---
# DBs passwords
db_root_pass: openstack
CINDER_DBPASS: openstack

# Other passwords
CINDER_PASS: openstack
RABBIT_PASS: openstack

# IPs nodes
ip_controller: 172.31.82.248
ip_block: 172.31.91.50

# Device name from /dev/xxx for Cinder
device: xvdd
```
- roles/swift/defaults/main.yml

```bash
---
# Passwords
SWIFT_PASS: openstack
HASH_PATH_SUFFIX: openstack
HASH_PATH_PREFIX: openstack

# Device name from /dev/xxx for Swift
device1: xvdd
device2: xvde

# IPs Nodes
ip_object: 172.31.82.229

# SWIFT URL
SWIFT_URL: http://controller:8080/v1/
```
3. Run Ansible playbook

```bash
ansible-playbook -v -i inventory.ini playbook-deploy.yml
````
4. Access Openstack dashboard

To access OpenStack open a browser and access ```INSTANCE_PUBLIC_IP/horizon``` address.
