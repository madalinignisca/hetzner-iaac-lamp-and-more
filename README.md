# IaaC for EXP
_by Madalin Ignisca <git@madalin.me>_

##Important:
**Ensure to talk to the team about the current saved state if *.*state* files are present in the repo!!!**

You need to have a recent Terraform and Ansible installed.

You must create an extra file for providing the Hetzner token or pass it by param.
Copy terraform.auto.tfvars.example to terraform.auto.tfvars and replace the token value with yours.

TIP: _You can create tokens per users. Hetzner provides audit per Token and IP and can be used to know when something happened in infrastructure_

Ensure your public key is in the cloud init file, in case that a fresh installation is needed.

Documentation to be completed <1 week before full delivery
