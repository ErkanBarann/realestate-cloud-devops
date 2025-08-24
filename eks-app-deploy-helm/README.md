# Module-5: Application Deployment on AWS EKS Using Helm

## Objective
In this task, the multi-service application previously deployed in **TASK-4** was redeployed using **Helm charts** on **AWS EKS (Elastic Kubernetes Service)**. The entire process was automated via **Jenkins**, where all required tools were installed, the EKS cluster was created using `eksctl`, the Helm chart was prepared, and the application was deployed. Additionally, **Nginx Ingress** was installed for external access and a **Prometheus-Grafana monitoring stack** was configured for observability.

---

## Requirements
- AWS account  
- Jenkins (pre-installed)  
- Tools installed on Jenkins server:
  - AWS CLI  
  - kubectl  
  - eksctl  
  - Helm  
  - S3 Plugin (for Helm chart repository)  
- Git and GitHub  
- AWS EKS & ECR  
- Prometheus & Grafana  

---

## Completed Steps

### 1. Tool Setup on Jenkins Server
- The following tools were installed on the Jenkins machine:
  - AWS CLI  
  - `kubectl`  
  - `eksctl`  
  - Helm  
  - Jenkins S3 Plugin for Helm chart management

### 2. Creating AWS EKS Cluster
- The EKS cluster was created using the `eksctl` command:
  ```bash
  eksctl create cluster --name my-cluster --region eu-central-1 --nodes 2
  ```

### 3. Preparing the Helm Chart
- A Helm chart was created (or adapted) for the same multi-service application used in TASK-4.
- The chart included standard files like `Chart.yaml`, `values.yaml`, and the `templates/` directory.

### 4. Deploying the Application (Same App from TASK-4)
- The Jenkins pipeline included Helm deployment commands such as:
  ```bash
  helm upgrade --install my-application ./path-to-chart --namespace app-namespace
  ```

### 5. Installing Nginx Ingress
- Nginx Ingress controller was installed using Helm:
  ```bash
  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  helm repo update
  helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-basic --create-namespace
  ```

### 6. Installing Prometheus-Grafana Monitoring Stack
- The monitoring stack was deployed via Helm from Jenkins:
  ```bash
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace
  ```

### 7. Automating with Jenkins Pipeline
- A `Jenkinsfile` was created to automate the following:
  - Clone project from GitHub  
  - Package and deploy Helm charts  
  - Install Ingress and monitoring tools  
  - Apply necessary Kubernetes configurations

### 8. Testing and Validation
- Verified that the application was running successfully on AWS EKS.  
- Confirmed external access via Nginx Ingress.  
- Validated Prometheus and Grafana dashboards for application metrics.

### 9. Documentation and Reporting
- All steps, configurations, and commands were well documented.  
- Challenges (e.g., RBAC permissions, Helm chart path issues) and their solutions were reported.

---

## Outcome
The multi-service application from TASK-4 was successfully redeployed on AWS EKS using Helm. The process was fully automated via Jenkins. With Ingress and monitoring in place, the application became accessible, observable, and production-ready.