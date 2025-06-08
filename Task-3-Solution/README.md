# TASK-3: Deploying a Multi-Service Application on AWS with Docker Compose

## Objective  
This task focuses on deploying a multi-service web application (backend + frontend) on AWS EC2 instances using **Docker Compose**. The EC2 infrastructure was previously provisioned using **Terraform** (TASK-1) and configured with **Ansible** (TASK-2). In this task, the application is containerized, the images are pushed to **AWS ECR**, and the deployment is automated using **Jenkins**.

> **Note:** The Jenkins pipeline created in this task is **independent** of TASK-1 and TASK-2. Therefore, **TASK-1 and TASK-2 must be completed manually beforehand** to ensure that the infrastructure and configuration are ready for deployment.

---

## Requirements
- Active AWS account  
- Configured AWS CLI  
- Docker and Docker Compose installed  
- Terraform and Ansible installed and used for TASK-1 and TASK-2  
- Jenkins installed and properly configured  
- Git and GitHub access  
- AWS ECR access and appropriate IAM permissions  

---

## Completed Steps

### 1. Created Dockerfiles for Backend and Frontend
- Separate `Dockerfile`s were written for both backend and frontend services.
- Each file defines the base image, dependencies, and startup commands for containerization.

### 2. Built Docker Images and Pushed to AWS ECR
- Created two repositories in AWS ECR: one for the backend and one for the frontend.
- Built the Docker images locally and pushed them to ECR using:
  ```bash
  aws ecr get-login-password | docker login ...
  docker build -t backend .
  docker tag backend <account-id>.dkr.ecr.<region>.amazonaws.com/backend
  docker push <account-id>.dkr.ecr.<region>.amazonaws.com/backend
  ```
- The same process was followed for the frontend image.

### 3. Configured Docker Compose
- A `docker-compose.yml` file was created to define and connect the backend and frontend services.
- It includes port mappings, environment variables, and Docker image references from ECR.

### 4. Created Jenkins Pipeline (Only for TASK-3)
- A `Jenkinsfile` was written to define the following stages:
  - Clone the GitHub repository  
  - Build Docker images  
  - Push images to AWS ECR  
  - SSH into EC2 instances and deploy using `docker-compose up -d`  
- This pipeline **does not include** the Terraform or Ansible steps from TASK-1 and TASK-2.  
  These infrastructure and configuration steps must be **completed manually beforehand**.

### 5. Testing and Verification
- The application was accessed via the public IP of the EC2 instances.
- Functionality was tested:
  - Frontend loaded successfully
  - Backend communication verified
  - Network setup and port accessibility confirmed

---

## Outcome
The application is now successfully running on AWS EC2 instances using Docker Compose. All deployment steps are automated via Jenkins, and the infrastructure was prepared using Terraform and Ansible in the previous tasks. This task completes the final stage of getting the application live and accessible.