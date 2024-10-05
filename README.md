# Provision a highly available application

## Overview
> In this project will deploy a highly available appcalition and database. the main aim of this project is to build a successfull communication between The Application and The Database; the infrastructure componenets consists of the following:
- Provision a Multi-az RDS PostgreSQL database.
- Provision an autoscaling group and load balancer for two EC2 machines.
- Build a simple Python Flask application that build a connection with The RDS.
<br> 
The Infrastructure provisioning will be automated whereby AWS Pipeline besides IaC Terraform, for more info view the Deploy_a_highly_available_Sprint_application.pdf document.<br><br>

## Architecture Diagram

![Architecture Diagram](Architecture Diagram.drawio.png)
<br><br>


## Directory structure discovery


├── buildspec.yml  >> AWS pipeline configuration file.<br>
├── infra          >> Terrafrom resources directory<br>
│   ├── asg.tf                >> Auto-scaling group resources<br>
│   ├── configureProvider.tf  >> terrafrom provider configurations<br>
│   ├── igw.tf             >> internet gateway resources<br>
│   ├── lb.tf              >> load balancer resources<br>
│   ├── locals.tf          >> local variables<br>
│   ├── rds.tf             >> RDS resources<br>
│   ├── rt.tf              >> Route table resources<br>
│   ├── sg.tf              >> Security group resources<br>
│   ├── subnet.tf          >> Subnet resources<br>
│   ├── terraform.tfvars   >> Variable values file<br>
│   ├── variables.tf       >> Variable definition file<br>
│   └── vpc.tf             >> VPC resources<br>
├── README.md<br>
└── srcApp                 >> Python Flask source code<br>
    ├── app.py             >> Python application file<br>
    └── prerequisites.sh   >> Prerequisites should be installed first<br>

