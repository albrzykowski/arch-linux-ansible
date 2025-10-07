# Arch Linux Configuration with Ansible

## Prerequisites
1. Install required packages: `sudo pacman -Syu openssh python`
2. Install Ansible: `sudo pacman -S ansible; ansible-galaxy collection install community.general`

## Usage
Run playbooks in order:
1. `ansible-playbook -i inventory.ini configure_additionals.yml`
2. `ansible-playbook -i inventory.ini configure_common_packages.yml -K`
3. `ansible-playbook -i inventory.ini configure_nvim.yml`
4. `ansible-playbook -i inventory.ini configure_ssh_keys.yml -K`
5. `ansible-playbook -i inventory.ini configure_git.yml -K`
