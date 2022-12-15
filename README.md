# IaaC for LAMP+ on Hetzner
_by Madalin Ignisca <git@madalin.me>_

This is work in progress!!!

Using Terraform and Ansible, this will provision a minimal server tunned for PHP applications, maximized MariaDB (mysql) performance, and some miminal addons that make all work at best.

The concept is made on my experince on both manually setting up servers an also using Ansible.

It will use only official builtin or community collections.

It's goal is for maximizing performance, ensure security, allow fast recovery, while keeping costs at a minimum.

The public repository will work only on CentOS Stream latest edition. Me the author of this have no interest in supporting Debian, Ubuntu or other distributions.
RedHat, Rocky and Alma Linux support is offered based on sponsorships or signed contract.

##Important:
**Ensure to talk to the team about the current saved state if *.*state* files are present in the repo!!!**

You need to have a recent Terraform and Ansible installed.

You must create an extra file for providing the Hetzner token or pass it by param.
Copy terraform.auto.tfvars.example to terraform.auto.tfvars and replace the token value with yours.

TIP: _You can create tokens per users. Hetzner provides audit per Token and IP and can be used to know when something happened in infrastructure_

Ensure your public key is in the cloud init file, in case that a fresh installation is needed.

Documentation to be completed <1 week before full delivery
