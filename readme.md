# vim-configuration


This is a simple ansible playbook, that is used for configure and costumize Vim on Debian base distro.

Verified on: 
* Ubuntu-22.04
* kali-linux

### Pre-requirements

[Ansible](#install-ansible) must be installed.

### Usage

1. `cd` into project directory.
2. Execute:
	
	`ansible-playbook vim-config.yaml --extra-vars "email=name.surname@domain.com" -K`
	* `-K` - provide *sudo* password for ansible *privilege escalation*
	* `name`, `surname`, `domain` - is actualy your email address.
		This provided data will be used to extract and write to **personal.template** file from Jinja2 template.


### Install Ansible

* Update repos list:

	`sudo apt-get update`

* Install Ansible:

	`sudo apt-get install ansible -y`
	* `-y` - assume "yes" as answer to all prompts and run non-interactively


---
