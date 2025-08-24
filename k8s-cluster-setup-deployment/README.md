# Module-4: Kubernetes Cluster Setup and Application Deployment on AWS

## Objective
This task involved setting up a Kubernetes cluster on AWS using **Terraform** for infrastructure provisioning and **Ansible** for configuration. A previously Docker Compose-based multi-service application was converted into **Kubernetes manifests** using **Kompose**, customized with **Kustomize**, and deployed to the cluster using `kubectl`. The entire process was automated using **Jenkins**.

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
- Kubernetes (e.g., lightweight K3s distribution)

---

## Completed Steps

### 1. Created SSH Key Pair with AWS CLI
- A new SSH key pair was generated using AWS CLI.
- This key pair was used for connecting to EC2 instances via SSH.

### 2. Provisioned EC2 Instances with Terraform
- At least two EC2 instances were created (one master, one node).
- Security groups, IAM roles, and networking settings were configured accordingly.

### 3. Configured Kubernetes Cluster with Ansible
- Ansible playbooks were used to install Kubernetes packages.
- The master node was initialized, and other nodes were joined to the cluster.

### 4. Built Docker Images and Pushed to AWS ECR
- Docker images for backend and frontend services were built.
- Images were pushed to corresponding repositories in AWS ECR.

### 5. Converted Docker Compose to Kubernetes Manifests
- The `docker-compose.yml` file was converted into Kubernetes manifests using **Kompose**.
- The manifests were further customized using **Kustomize** (e.g., image paths, environment variables).

### 6. Deployed Application Using kubectl
- The application was deployed to the Kubernetes cluster using:
  ```bash
  kubectl apply -k .
  ```
- The status of pods and services was verified using `kubectl get pods` and `kubectl get svc`.

### 7. Automated Deployment with Jenkins
- A `Jenkinsfile` was created with the following stages:
  - Clone code from GitHub
  - Build Docker images and push to ECR
  - Generate and customize Kubernetes manifests (Kompose + Kustomize)
  - Deploy to Kubernetes cluster using `kubectl`
- The pipeline automated the full CI/CD workflow end-to-end.

### 8. Testing and Validation
- Verified that the application was successfully deployed on Kubernetes.
- Frontend and backend services were tested for accessibility and functionality.

### 9. Documentation and Reporting
- All scripts, configurations, and steps were documented.
- Challenges encountered (e.g., node connectivity, permission issues) and their resolutions were recorded.

---

## Outcome
A fully operational Kubernetes environment was set up on AWS, and the multi-service application was successfully deployed. The entire setup and deployment process was automated using Jenkins, following DevOps best practices.