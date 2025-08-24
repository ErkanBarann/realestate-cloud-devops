# Module-1: Modular Virtual Machine Provisioning on AWS using Terraform and Jenkins

## Objective  
This project aimed to provision modular virtual machines (EC2 instances) on AWS using Terraform and automate the infrastructure lifecycle through Jenkins. Multiple environments such as **development**, **testing**, **staging**, and **production** were handled using Terraform workspaces.

## Requirements  
The following tools and services were used throughout the project:

- AWS Account  
- Terraform  
- Jenkins  
- Git & GitHub

## Project Summary  
The project was successfully implemented in six main stages:

---

### 1. Project Structure Setup  
- A GitHub repository was created to host all Terraform configurations and the Jenkins pipeline script (`Jenkinsfile`).  
- The repository was cloned to the local development machine for further configuration and development.

### 2. Terraform Configuration  
- Separate Terraform workspaces (`dev`, `test`, `staging`, `prod`) were created to manage each environment using a single configuration structure.  
- Environment-specific input variables were defined (e.g., instance type, size, tags).  
- Output variables were used to display essential resource information such as public IP addresses of EC2 instances.

### 3. Jenkins Installation and Configuration  
- Jenkins was installed on a dedicated EC2 instance running Amazon Linux.  
- Terraform was installed on the same instance to enable infrastructure provisioning from Jenkins.  
- A new pipeline project was created in Jenkins and integrated with the GitHub repository using webhooks for automatic triggering.

### 4. Jenkins Pipeline Development  
- A `Jenkinsfile` was created to automate the infrastructure lifecycle.  
- The pipeline was designed to:
  - Create AWS key pairs using the AWS CLI.
  - Run Terraform `init`, `plan`, and `apply` commands for the selected workspace/environment.  
- Parameters were added to the pipeline to allow dynamic environment selection.  
- GitHub webhooks were configured to automatically trigger the pipeline after each push.

### 5. Testing and Validation  
- The `terraform apply` command was executed for each workspace to validate the infrastructure modules.  
- EC2 instances were successfully created in all environments.  
- The Jenkins pipeline was verified to be working correctly and was automatically triggered upon repository updates.

### 6. Documentation and Reporting  
- Each project step, including Terraform and Jenkins configurations, was thoroughly documented.  
- Challenges (e.g., workspace switching, key pair handling, permissions) were resolved and noted.  
- A final report was prepared summarizing all provisioned resources, including instance IDs, IP addresses, and environment names.

---

## Result  
The automation of multi-environment EC2 instance provisioning using Terraform and Jenkins was completed successfully. The solution is modular and scalable, making it easy to expand with new services or modules in the future.
