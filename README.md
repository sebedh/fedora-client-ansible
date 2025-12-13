# Ansible to setup a Fedora workstation

## Requirements
- working incus
- ansible
- ansible community collection

# Instructions
#. Run `1.spawn_vm.sh` to setup a VM for development, it will require 40GiB of space
#. Run `2.create_inventory.sh`, to create ansible `inventory` file
#. Run `3.ansible.sh` to actuall playbooks, you can any ansible flags to it
