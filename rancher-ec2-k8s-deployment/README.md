# Module-6: Kubernetes Management and Monitoring with Rancher and EFK Stack

## Objective
In this module, the **same multi-service application previously deployed via Helm on AWS EKS in Module-5** is redeployed using a **Kubernetes cluster created via Rancher UI**.  
This time, the Helm charts are **versioned in a GitHub repository instead of an S3 bucket**.  
The cluster is managed using **Kubernetes Lens**, and an **EFK stack (Elasticsearch, Fluentd, Kibana)** is implemented for centralized log monitoring.  
This module provides hands-on experience with Rancher-based application management and observability.

---

## Requirements
- **Cloud Provider**: AWS EC2 (Ubuntu 22.04)  
- **Software**: Rancher, Helm, Kubernetes CLI (kubectl), Kubernetes Lens  
- **Other Requirements**: SSH access, AWS Route 53 (optional)  

---

## Implementation Steps

### 1. Environment Preparation for Rancher Installation
- Created an AWS EC2 instance (Ubuntu 22.04) with appropriate security group rules.  
- Opened required ports for Rancher (e.g., 80, 443).  
- Connected via SSH and updated system packages.  

### 2. Kubernetes Cluster Creation via Rancher UI with RKE
- Installed Rancher on the EC2 instance.  
- Accessed Rancher UI through a web browser.  
- Used **Rancher Kubernetes Engine (RKE)** to create a new cluster.  
- Configured cluster settings such as node roles, networking, and authentication.  

### 3. Application Deployment via Helm (Using GitHub-hosted Charts)
- Cloned the GitHub repository containing the Helm charts (previously used in **Module-5**).  
- Added and updated the Helm repository.  
- Deployed the application to the Rancher-managed cluster with Helm.  

### 4. Cluster Visualization Using Kubernetes Lens
- Installed **Kubernetes Lens** on a local machine.  
- Imported the `kubeconfig` file provided by Rancher.  
- Visualized and managed the Kubernetes cluster using Lens UI.  

### 5. Log Monitoring with EFK Stack
- Deployed the **EFK stack** (Elasticsearch, Fluentd, Kibana) on the cluster using Helm or manifests.  
- Configured Fluentd to collect logs from pods and forward them to Elasticsearch.  
- Accessed the Kibana dashboard to query, visualize, and analyze logs.  

---

## Outcome
At the end of this module, the following objectives were achieved:  
- A Kubernetes cluster was created and managed using **Rancher**.  
- The application was redeployed using **Git-hosted Helm charts**.  
- The cluster was visualized and managed with **Kubernetes Lens**.  
- Centralized log monitoring was implemented with the **EFK stack**.  

This final module concludes the DevOps project by integrating **cluster provisioning, Helm-based deployments, visual management tools, and log analytics** into a single end-to-end workflow.
