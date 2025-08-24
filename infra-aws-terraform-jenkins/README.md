# Module 1 – Modular Virtual Machine Provisioning on AWS with Terraform & Jenkins

## Overview  
This module provisions modular virtual machines (EC2 instances) on AWS using **Terraform**, and automates the infrastructure lifecycle through **Jenkins pipelines**.  
Multiple environments (development, testing, staging, production) are managed using **Terraform workspaces**.

---

## Requirements  
- AWS Account  
- Terraform  
- Jenkins  
- Git & GitHub  

---

## Implementation Stages  

### 1. Project Structure Setup  
- Created a GitHub repository to host Terraform configurations and the Jenkins pipeline script (`Jenkinsfile`).  
- Cloned the repository to the local machine for development.  

### 2. Terraform Configuration  
- Defined separate **Terraform workspaces** (`dev`, `test`, `staging`, `prod`) to manage environments.  
- Used environment-specific variables (e.g., instance type, tags).  
- Implemented output variables to display essential resource info (public IPs, instance IDs).  

### 3. Jenkins Installation & Setup  
- Installed Jenkins on a dedicated Amazon Linux EC2 instance.  
- Installed Terraform on the same instance for provisioning.  
- Configured Jenkins to integrate with GitHub via webhooks for automatic pipeline triggers.  

### 4. Jenkins Pipeline Development  
- Created a `Jenkinsfile` to automate Terraform lifecycle:  
  - Generate AWS key pairs using AWS CLI  
  - Run `terraform init`, `terraform plan`, `terraform apply` for selected workspace  
- Added parameters for dynamic environment selection.  
- Configured GitHub webhooks to trigger pipeline on every push.  

### 5. Testing & Validation  
- Executed `terraform apply` in each workspace to validate configurations.  
- Verified successful EC2 provisioning across environments.  
- Confirmed Jenkins pipeline automation works end-to-end.  

### 6. Documentation & Reporting  
- Documented Terraform and Jenkins configurations.  
- Resolved challenges (workspace switching, key pairs, permissions).  
- Prepared final report with instance IDs, IPs, and environment mappings.  

---

## Result  
The automation of multi-environment EC2 provisioning was completed successfully using **Terraform + Jenkins**.  
The solution is **modular, scalable, and production-ready**, and can be easily extended with new infrastructure services or modules in the future.
