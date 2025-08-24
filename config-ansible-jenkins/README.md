# TASK-2: Configuring AWS Environments with Ansible and Jenkins

## Objective  
This project focused on automating the **configuration of multiple AWS environments** (such as `dev`, `test`, and `prod`) using **Ansible** and **Jenkins**.  
In this task, only the **`dev` environment** was configured. The infrastructure for all environments had already been provisioned using **Terraform** in **Task-1**.  
The goal was to allow Ansible to dynamically locate the correct EC2 instance based on AWS tags and apply the appropriate environment-specific configuration via Jenkins.

## Requirements  
The following tools and services were used in this task:

- AWS Account  
- Ansible  
- Jenkins  
- Git & GitHub  
- (Terraform was only used previously in Task-1 for provisioning.)

## Project Summary  
The configuration process was successfully completed in six steps:

---

### 1. Creation of Ansible Playbooks  
- Ansible playbooks were written specifically for the **development (dev)** environment.  
- The playbooks performed the following tasks:  
  - Installed **Docker** and **Docker Compose**  
  - Enabled and started the Docker service  
  - Added the default user to the `docker` group  
- The playbook was designed to be reusable and easily adaptable for other environments in the future.

---

### 2. Locating EC2 Instances via AWS Tags  
- In **Task-1**, EC2 instances were tagged with metadata such as `Environment=dev`, `Name=jenkins-dev`, etc.  
- In this task, Ansible identified the correct EC2 instance by filtering based on these tags.  
- The Jenkins pipeline used the AWS CLI to:  
  - Query EC2 instances based on tags (e.g., `Environment=dev`)  
  - Retrieve the public IP address of the matching instance  
  - Use this IP in the Ansible inventory to run the configuration  
- **Note:** Terraform was **not** executed again in this pipeline.

---

### 3. Jenkinsfile Creation and Configuration  
- A `Jenkinsfile` was created to automate the Ansible-based configuration process.  
- The pipeline included:  
  - Using the AWS CLI to find the EC2 instance by tag  
  - Fetching its public IP address  
  - Running the Ansible playbook using that IP address

---

### 4. Dynamic Parameters in Jenkins Pipeline  
- An environment selection parameter was added to the Jenkins UI.  
- For this task, only the **`dev`** environment was enabled.  
- Based on the selected environment, the pipeline executed the matching Ansible playbook after resolving the instance IP.

---

### 5. Testing and Validation  
- The Jenkins pipeline was successfully run for the `dev` environment.  
- The EC2 instance was located using AWS tags and accessed via SSH.  
- Docker and Docker Compose were verified to be correctly installed and operational.

---

### 6. Documentation and Reporting  
- All steps, commands, and logic (especially tag-based EC2 discovery) were documented in detail.  
- Issues such as AWS CLI access, tag filtering, and SSH connectivity were resolved.  
- A final report was prepared summarizing the environment state and automation outcome.

---

## Result  
The configuration of the AWS development environment was successfully automated using Ansible and Jenkins.  
The EC2 instance was dynamically discovered using AWS tags.  
Terraform was not rerun during this task, as the infrastructure had already been created in Task-1.  
The system is now ready for Docker-based development workflows and can be extended to `test` and `prod` environments in future tasks.
