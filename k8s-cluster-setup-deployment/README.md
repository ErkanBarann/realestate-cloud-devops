# Module-4: Kubernetes Cluster Setup and Application Deployment on AWS

## Objective
This module involved setting up a Kubernetes cluster on AWS using **Terraform** for infrastructure provisioning and **Ansible** for configuration.  
A previously Docker Compose–based multi-service application was converted into **Kubernetes manifests** using **Kompose**, customized with **Kustomize**, and deployed to the cluster with `kubectl`.  
The entire process was automated end-to-end using **Jenkins pipelines**.

---

## Requirements
- AWS account and configured AWS CLI  
- Terraform  
- Ansible  
- Docker  
- Jenkins  
- Git and GitHub access  
- AWS ECR access  
- **Kompose** tool  
- **Kustomize** tool  
- Kubernetes distribution (e.g., lightweight **K3s**)  

---

## Implementation Steps

### 1. Created SSH Key Pair with AWS CLI
- Generated a new SSH key pair with AWS CLI.  
- Used the key for connecting to EC2 instances via SSH.  

### 2. Provisioned EC2 Instances with Terraform
- Created at least two EC2 instances (one master, one worker node).  
- Configured networking, IAM roles, and security groups.  

### 3. Configured Kubernetes Cluster with Ansible
- Installed Kubernetes components via Ansible playbooks.  
- Initialized the master node and joined worker nodes into the cluster.  

### 4. Built Docker Images and Pushed to AWS ECR
- Built Docker images for backend and frontend services.  
- Pushed the images to respective AWS ECR repositories.  

### 5. Converted Docker Compose to Kubernetes Manifests
- Converted `docker-compose.yml` into Kubernetes manifests with **Kompose**.  
- Customized manifests using **Kustomize** (image paths, environment variables, configs).  

### 6. Deployed Application with kubectl
- Deployed manifests to the Kubernetes cluster using `kubectl apply -k .`.  
- Verified pods and services with `kubectl get pods` and `kubectl get svc`.  

### 7. Automated Deployment with Jenkins
- Created a Jenkinsfile including the following stages:  
  - Clone code from GitHub  
  - Build Docker images and push to ECR  
  - Generate and customize Kubernetes manifests (Kompose + Kustomize)  
  - Deploy to Kubernetes cluster using `kubectl`  
- Achieved a fully automated CI/CD pipeline.  

### 8. Testing and Validation
- Verified successful deployment of the multi-service application.  
- Frontend and backend functionality tested for accessibility and correctness.  

### 9. Documentation and Reporting
- Documented scripts, configurations, and execution steps.  
- Recorded challenges such as node connectivity and permissions, along with resolutions.  

---

## Outcome
A fully functional Kubernetes environment was set up on AWS.  
The multi-service application was successfully deployed and managed on the cluster.  
The end-to-end process — provisioning, configuration, containerization, and deployment — was automated with Jenkins, aligning with DevOps best practices.  
