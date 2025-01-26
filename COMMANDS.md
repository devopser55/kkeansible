## previous ansible commands
ansible stapp02 -u steve -m ping -i inventory
ansible all -u steve -m ping -i inventory.txt
ansible-vault encrypt_string...
ansible-config init
ansible-config dump
ansible-config list

## just running the ping module with file called inventory as inventory
ansible all -m ping -i inventory

### send commands to server(s)
ansible -i inventory -m command -a id localhost
ansible -i inventory -m command -a "ls -l" localhost

ansible -i inventory -a id localhost

### run playbook on limited subset of hosts
ansible-playbook -i inventory.txt  install_nginx_playbook.yml --check -K --limit stapp01
## below will remove host key checking
export ANSIBLE_HOST_KEY_CHECKING=False
