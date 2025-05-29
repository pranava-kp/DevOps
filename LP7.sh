#!/bin/bash
cd
rm -rf ansible
clear
sudo apt update
sudo apt upgrade -y
clear
sudo apt install ansible -y
cd
mkdir ansible
cd ansible
touch hosts.ini setup.yml
cat > hosts.ini <<'EOF'
[local]
localhost ansible_connection=local
EOF
cat > setup.yml <<'EOF'
---
- name: Basic Server Setup
  hosts: local
  become: yes
  gather_facts: no
  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
    - name: Install curl
      apt:
        name: curl
        state: present
EOF
clear
ansible-playbook -i hosts.ini setup.yml --check -K

