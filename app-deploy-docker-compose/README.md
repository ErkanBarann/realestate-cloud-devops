# Module-3: Deploying a Multi-Service Application on AWS with Docker Compose

## Objective
This module focuses on deploying a multi-service web application (backend + frontend) on AWS EC2 instances using **Docker Compose**.  
The EC2 infrastructure was previously provisioned using **Terraform** (Module-1) and configured with **Ansible** (Module-2).  
In this stage, the application is containerized, the images are pushed to **AWS ECR**, and the deployment is automated using **Jenkins**.

> **Note:** The Jenkins pipeline created in this module is **independent** of Module-1 and Module-2.  
> Therefore, Module-1 and Module-2 must be completed manually beforehand to ensure that the infrastructure and configuration are ready for deployment.

---

## Requirements
- Active AWS account  
- Configured AWS CLI  
- Docker and Docker Compose installed  
- Terraform and Ansible executed for Module-1 and Module-2  
- Jenkins installed and properly configured  
- Git and GitHub access  
- AWS ECR access with appropriate IAM permissions  

---

## Implementation Steps

### 1. Created Dockerfiles for Backend and Frontend
- Separate `Dockerfile`s were written for both backend and frontend services.  
- Each file defines the base image, dependencies, and startup commands for containerization.  

### 2. Built Docker Images and Pushed to AWS ECR
- Created two repositories in AWS ECR: one for the backend and one for the frontend.  
- Built Docker images locally and pushed them to ECR.  
- The same process was followed for the backend and frontend images.  

### 3. Configured Docker Compose
- A `docker-compose.yml` file was created to define and connect the backend and frontend services.  
- It included:  
  - Port mappings  
  - Environment variables  
  - Docker image references from ECR  

### 4. Created Jenkins Pipeline (Specific to Module-3)
- A `Jenkinsfile` was written with the following stages:  
  - Clone the GitHub repository  
  - Build Docker images  
  - Push images to AWS ECR  
  - SSH into EC2 instances and deploy using `docker-compose up -d`  
- This pipeline **does not include** the Terraform or Ansible steps from Module-1 and Module-2.  
  These must be completed manually beforehand.  

### 5. Testing and Verification
- The application was accessed via the public IP of the EC2 instances.  
- Functionality was verified:  
  - Frontend loaded successfully  
  - Backend communication confirmed  
  - Networking and port accessibility tested  

---

## Outcome
The application is successfully running on AWS EC2 instances using **Docker Compose**.  
All deployment steps are automated via Jenkins, while the infrastructure and configuration were prepared in **Module-1 and Module-2**.  
This module completes the deployment stage of getting the multi-service application live and accessible.  
