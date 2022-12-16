# IaaC for LAMP+ on Hetzner
_by Madalin Ignisca <git@madalin.me>_

This is work in progress!!!

Using Terraform and Ansible, this will provision a minimal server tunned for PHP applications, maximized MariaDB (mysql) performance, and some miminal addons that make all work at best.

The concept is made on my experince on both manually setting up servers an also using Ansible.

It will use only official builtin or community collections.

It's goal is for maximizing performance, ensure security, allow fast recovery, while keeping costs at a minimum.

## Support:
The public repository will work only on CentOS Stream latest edition. Only community support on [Discussions](https://github.com/madalinignisca/hetzner-iaac-lamp-and-more/discussions).
Me the author of this have no interest in supporting Debian, Ubuntu or other distributions.

RedHat, Rocky and Alma Linux support is offered based on sponsorships or signed contract.

Use Issues only to report bugs. Suggestions are welcomed only in Discussions and selection will be on interest of majority participating or sponsorship level.

## Important:
**Ensure to talk to the team about the current saved state if *.*state* files are present in the repo!!!**

You need to have a recent Terraform and Ansible installed. Use WSL in Windows. Should not have any issues with full Ansible, not only ansible-core.

Install Terraform: https://developer.hashicorp.com/terraform/downloads

Install Ansible:
- CentOS/Fedora/RHEL: `sudo dnf install ansible`
- Debian/Ubuntu: `sudo apt install ansible`

You must create an extra file for providing the Hetzner token or pass it by param.
Copy terraform.auto.tfvars.example to terraform.auto.tfvars and replace the token value with yours.

As normal with Terraform, ensure you save your new state and variables files in a secure environment and you **always use the latest and update after any change**!!!
Keep also your `inventory` up to date in same location.

NOTE: Make sure you don't change something in terraform related to the webserver. Terraform is destroy/create only, so the webserver would be wiped out with all data.
to be able to support server recreation, you must create volumes for all critical data (example database, application uploads etc.) and extend ansible to mount them
in the correct location before anything else, and don't forget about fstab entries. This will allow you to have destroy/recreate option with Terraform and change servers
whenever is needed, actually being something popular in horizontal scalling setups.

TIP: _You can create tokens per users. Hetzner provides audit per Token and IP and can be used to know when something happened in infrastructure_

Ensure your public key is in the cloud init file, in case that a fresh installation is needed.

Run:
- `terraform apply`
- `ansible-playbook -i inventory playbook.yml`

Work in progress...
