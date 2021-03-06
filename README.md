## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![redteamelkvnets](https://user-images.githubusercontent.com/91142394/153730206-62795721-6d4d-4974-85cc-2011d21ab9b0.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Filebeat_and_metricbeat_playbook file may be used to install only certain pieces of it, such as Filebeat.

<img width="419" alt="Filebeat_and_Metricbeat_Playbook" src="https://user-images.githubusercontent.com/91142394/153730220-00a5a6c3-d977-4c39-bae5-9320f49daa2a.png">


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load Balancers help defend the accessibility of networks from malicious actors using DDoS attacks and overloading from too much internet traffic. Being able to manage multiple machines from a secure point is the advantage of a Jump Box Provisioner. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the applications and system logs.
The filebeat service monitors logs of traffic that is chosen.
Metricbeat monitors system usage such as CPU, Memory, and Network IO.

The configuration details of each machine may be found below.

| Name                 | Function | IP Address   | Operating System   |
|----------------------|----------|--------------|--------------------|
| Jump Box Provisioner | VM       | 10.0.0.4     | Linux-Ubuntu 20.04 |
| Web-1                | VM       | 10.0.0.5     | Linux-Ubuntu 20.04 |
| Web-2                | VM       | 10.0.0.6     | Linux-Ubuntu 20.04 |
| ELK                  | VM       | 52.161.26.25 | Linux-Ubuntu 20.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
96.228.35.137

Machines within the network can only be accessed by SSH.
My Personal Machine can access the ELK VM from IP address 96.228.35.137.

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses |
|----------------------|---------------------|-----------------------
| Jump Box Provisioner | Yes                 | 96.228.35.137        |
| Web-1                | No                  | 10.0.0.4             |
| Web-2                | No                  | 10.0.0.4             |
| ELK                  | Yes                 | 96.228.35.137        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
By using Ansible to automate configuration, you can quickly setup and change the functions of a number of machines. 

![configure elk vm playbook](https://user-images.githubusercontent.com/91142394/153730252-76fcde40-5c5b-4362-9a85-ba9905c102ae.png)

The playbook implements the following tasks:
- Install docker.io
- Install python3
- Install docker
- Increase Virtual Memory
- Use more memory
- Install seep/elk:761
- Enable docker service on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<img width="1234" alt="ELK_instance_running" src="https://user-images.githubusercontent.com/91142394/153730226-4dea34e9-75e7-4458-92ab-87848efb7c9b.png">


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.5
10.0.0.6

We have installed the following Beats on these machines:
-Filebeat
-Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat will collect data from logs that are created on the machines. You can expect var logs including system, wifi, and error logs.
Metricbeat collects data on how the system is running. This can include data on CPU usage and Memory usage statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/files.
- Update the ilebeat-config.yml file to include the IP address of the ELK machine under output.elastic search and setup.kibana.
- Run the playbook, and navigate to filbert dashboard on Kibana to check that the installation worked as expected.

Answer the following questions to fill in the blanks:
- Which file is the playbook? Where do you copy it? 
The playbook path and filename is /etc/ansible/roles/filebeat-playbook.yml.

- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on? 
The /etc/ansible/hosts file is edited to contain groups of IP addresses to specify where to install each piece of software. 

- Which URL do you navigate to in order to check that the ELK server is running? 
http://52.161.26.25:5601/app/kibana

As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
Navigate to /etc/ansible/roles on your ansible container in the Jump Box Provisioner and run:
ansible-playbook filebeat-playbook.yml

<img width="1916" alt="Metricbeat up and running" src="https://user-images.githubusercontent.com/91142394/153730237-74e95903-df64-4626-b55b-de517c6b7f17.png">

