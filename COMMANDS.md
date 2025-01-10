## previous ansible commands
ansible stapp02 -u steve -m ping -i inventory
ansible all -u steve -m ping -i inventory.txt

## just running the ping module with file called inventory as inventory
ansible all -m ping -i inventory

### send commands to server(s)
ansible -m command -a id localhost

### run playbook on limited subset of hosts
ansible-playbook -i inventory.txt  install_nginx_playbook.yml --check -K --limit stapp01
## below will remove host key checking
export ANSIBLE_HOST_KEY_CHECKING=False
