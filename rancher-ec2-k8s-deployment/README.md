# TASK-6: Kubernetes Management and Monitoring with Rancher and EFK Stack

## Objective
In this task, the **same multi-service application previously deployed via Helm on AWS EKS in TASK-5** is redeployed using a **Kubernetes cluster created via Rancher UI**.  
This time, the Helm charts are **versioned in a GitHub repository instead of an S3 bucket**.  
The cluster is managed using **Kubernetes Lens**, and **EFK stack (Elasticsearch, Fluentd, Kibana)** is implemented for centralized log monitoring.  
This task provides hands-on experience with Rancher-based application management and observability.

---

## Requirements
- **Cloud Provider**: AWS EC2 (Ubuntu 22.04)
- **Software**: Rancher, Helm, Kubernetes CLI (kubectl), Kubernetes Lens
- **Other Requirements**: SSH access, AWS Route 53 (optional)

---

## Completed Steps

### 1. Environment Preparation for Rancher Installation
- Created an AWS EC2 instance (Ubuntu 22.04) with appropriate security group rules.
- Opened necessary ports for Rancher (e.g., 80, 443).
- Connected via SSH and updated system packages:
  ```bash
  sudo apt update && sudo apt upgrade -y
  ```

### 2. Kubernetes Cluster Creation via Rancher UI with RKE
- Installed Rancher on the EC2 instance.
- Accessed Rancher UI through browser.
- Used Rancher Kubernetes Engine (RKE) to create a new cluster.
- Configured cluster settings (node roles, networking, authentication, etc.).

### 3. Application Deployment via Helm (Using GitHub-hosted Charts)
- Cloned the GitHub repository containing the Helm charts (previously used in TASK-5).
- Added Helm repository and updated it:
  ```bash
  helm repo add <repo-name> <repo-url>
  helm repo update
  ```
- Deployed the application to the Rancher-managed cluster using:
  ```bash
  helm install my-app <chart-name> --namespace my-namespace --create-namespace
  ```

### 4. Cluster Visualization Using Kubernetes Lens
- Installed Kubernetes Lens on local machine.
- Imported the kubeconfig file provided by Rancher.
- Visualized and managed the Kubernetes cluster from Lens UI.

### 5. Log Monitoring with EFK Stack
- Deployed the EFK stack (Elasticsearch, Fluentd, Kibana) to the cluster using Helm or YAML manifests.
- Configured Fluentd to collect logs from pods and forward them to Elasticsearch.
- Accessed Kibana dashboard to search, visualize, and analyze the logs.

---

## Outcome
Upon completing this task, you will have learned:
- How to set up a Kubernetes cluster using Rancher
- How to redeploy a previously defined application using Git-hosted Helm charts
- How to monitor and manage the cluster using Kubernetes Lens
- How to implement centralized logging using the EFK stack

This final task concludes the DevOps project by integrating cluster provisioning, Helm-based deployments, visual management tools, and log analytics.