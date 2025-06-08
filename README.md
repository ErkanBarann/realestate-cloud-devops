# DevOps Final Project – Real Estate Application

This project includes 6 tasks focused on building, configuring, deploying, and monitoring a real estate application using modern DevOps tools on AWS.

## Task Summary

### ✅ TASK-1: Modular Virtual Machine Creation on AWS  
Provisioned EC2 instances using **Terraform**, automated with **Jenkins**.

### ✅ TASK-2: Configuration with Ansible  
Configured infrastructure using **Ansible**, deployed through **Jenkins**. Built upon TASK-1.

### ✅ TASK-3: Application Deployment with Docker Compose  
Built Docker images and pushed to **AWS ECR**, deployed the application on EC2 using **Docker Compose**, automated via **Jenkins**.

### ✅ TASK-4: Migration to Kubernetes  
Converted the application to Kubernetes using **Kompose**, deployed using **K3s**, managed with **kubectl**, and automated via **Jenkins**.

### ✅ TASK-5: Deployment on AWS EKS with Helm  
Deployed the same application on **AWS EKS** using **Helm**, integrated **Nginx Ingress** and **Prometheus-Grafana** for monitoring. Fully automated using **Jenkins**.

### ✅ TASK-6: Kubernetes Management with Rancher and EFK Stack  
Created a Kubernetes cluster via **Rancher UI**, deployed the application using **Git-based Helm charts**, visualized and managed the cluster with **Kubernetes Lens**, and monitored logs using the **EFK stack**.

---

## Tools Used  
Terraform, Ansible, Docker, Jenkins, AWS (EC2, EKS, ECR), Helm, kubectl, eksctl, Kompose, Kustomize, Rancher, Lens, Prometheus, Grafana, EFK (Elasticsearch, Fluentd, Kibana)

---

## Result  
Using modern DevOps tools, Kubernetes, and AWS cloud infrastructure, a fully automated CI/CD pipeline was implemented for the real estate application.  
This project provides hands-on experience from infrastructure provisioning to application deployment and centralized monitoring on Kubernetes environments.