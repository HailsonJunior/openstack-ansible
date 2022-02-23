# OpenStack-Ansible

OpenStack-Ansible is a project do deploy OpenStack with Ansible in a way that makes ir more simple, secure and fast than a manual process.

With this project OpenStack is deployed using 4 nodes (controller, compute, block storage and object storage). For more details of how the environemnt is configured, se the [OpenStack Installation Guide](https://docs.openstack.org/install-guide/).

Getting started
------------
To use this project, first use it in a test environment before try in production, then adjust what is needed according to your environment. For a test environemnt this repository contains terraform files to create 4 instances on AWS.

Test environment
------------

On a Linux machine install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) and [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu) (I recomend to use a t2.micro machine on AWS). On this machine you need to proceed with the following steps using a user called ```ubuntu```:

1. Set AWS environment variables (or you can configure using [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

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
