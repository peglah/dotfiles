sudo apt install ansible -y
ssh-copy-id user@host
ansible all -m ping
ansible-playbook playbook.yml
