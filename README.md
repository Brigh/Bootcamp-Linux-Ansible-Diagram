## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

!Diagrams/ELK-Stack-Network-Diagram.jpg

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - /Ansible/Playbooks/

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorized access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_
	Load balancers protect the webservers from both outside access, as well as from being overwhelmed by DDoS attacks. 
	The jump box is able to check if a webserver is functioning before sending traffic to it. It also acts as a firewall, filtering
	what traffic is allowed through based on predetermined rules. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems and system LOGS.
- _TODO: What does Filebeat watch for?_ Collects data about the file system.
- _TODO: What does Metricbeat record?_ Collects machine metrics, such as uptime. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function | IP Address | Operating System |
|----------------------|----------|------------|------------------|
| Jump-Box-Provisioner | Gateway  | 10.1.0.7   | Linux            |
| Web-1                | Server   | 10.1.0.5   | Linux            |
| Web-2                | Server   | 10.1.0.6   | Linux            |
| ELK-Server1          | Server   | 10.0.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner and ELK-Server1 can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 72.223.80.401, 72.223.80.401:5601
- _TODO: Add whitelisted IP addresses_ 72.223.80.401, 72.223.80.401:5601

Machines within the network can only be accessed by Jump-Box-Provisioner. 10.1.0.7, 104.42.170.60
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
	Jump-Box-Provisioner. 10.1.0.7, 104.42.170.60

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 72.223.80.401        |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_
		- The main advantage of automating configuration with Ansible is the ease and reliability. With Ansible, you only have to run
		a playbook, and the script automatically configures the ELK machine to pre-determined and verified configurations, and
		can configure as many machines as necessary. This allows for large scale, depedable deployment. 

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
-  Install Docker.io using apt
- Install pip3 using apt
- Install Docker python module using pip
- Increase and use virtual memory of machine
- Download and launch Docker ELK Container sebp/elk:761

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

!Images/ELK-Docker-ps.jpg


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
	-10.1.0.5
	-10.1.0.6

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
	-filebeat 

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
	- Filebeat helps generate and organize log files to send to Logstash and Elasticsearch. 
	Specifically, it logs information about the file system, including when and which files have changed.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the my-playbook.yml file to /etc/ansible/myplaybook.yml
- Update the hosts file to include the ip address' of the web servers. 
- Run the playbook, and navigate to WEB1 and WEB2 to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it? 
	-my-playbook.yml is the playbook that configures the webservers. 

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
	-You update the ansible.cfg file to change the remote_user from root, to the user name established for the web servers. 
	-You update the hosts file with the ip addresses of the web servers. 
	-You specify with servers are elk, and which are webservers by listing the ips under the correct [heading].

- _Which URL do you navigate to in order to check that the ELK server is running?s
	-http://your-IP:5601/app/kibana#/home?_g=()

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
	- ansible-playbook my-playbook.yml 