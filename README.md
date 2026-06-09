# 🚀 DevOps Capstone Project – Milestone 2

## 📌 Dockerized Nginx Application with Host-Based Reverse Proxy

This milestone focuses on **containerizing a web application using Docker** and implementing a **host-based Nginx Reverse Proxy** to securely expose the application through a custom domain.

The project follows a **multi-cloud architecture** using **AWS, GCP, and Azure**, while introducing Docker-based deployments and production-style traffic routing.

---

## 🎯 Goal

Build a secure and automated deployment workflow that:

- Containerizes the application using Docker
- Builds and pushes Docker images through Jenkins
- Deploys containers on a Docker host
- Uses Nginx as a Reverse Proxy
- Exposes the application through a custom domain
- Restricts direct access to the application server

---

## 🏗️ Architecture

```text
Developer
    │
    ▼
GitHub
    │
    ▼
Jenkins (AWS EC2)
    │
    ▼
Docker Repository
    │
    ▼
Docker Host (GCP VM)
    │
    ▼
Nginx Reverse Proxy (Azure VM)
    │
    ▼
Browser (grishma.dev)
```

---

## ⚙️ Tech Stack

- **GitHub** – Source Code Repository
- **Jenkins** – CI/CD Automation Server
- **Docker** – Containerization Platform
- **Nginx** – Reverse Proxy & Web Server
- **AWS EC2 (Ubuntu)** – Jenkins Host
- **Google Cloud Platform (GCP VM)** – Docker Host
- **Microsoft Azure VM** – Reverse Proxy Host
- **Ubuntu 22.04 LTS** – Operating System
- **Custom Domain (grishma.dev)** – Application Access

---

## 🔧 What I Did

### Jenkins Server (AWS EC2)

- Provisioned AWS EC2 instance
- Installed and configured Jenkins
- Connected Jenkins with GitHub repository
- Created CI/CD pipeline for Docker image build and deployment

### Docker Host (GCP VM)

- Provisioned GCP Virtual Machine
- Installed Docker Engine
- Configured server to run containerized applications
- Pulled Docker image from Docker Repository
- Deployed Nginx application container on port **8081**

### Docker Image Creation

- Created Dockerfile using **nginx:latest**
- Packaged application into Docker image
- Automated image build process through Jenkins
- Pushed image to Docker Repository

### Reverse Proxy Configuration (Azure VM)

- Provisioned Azure Virtual Machine
- Installed and configured Nginx
- Configured host-based reverse proxy
- Forwarded incoming traffic to Docker container running on GCP VM
- Configured domain-based routing using **grishma.dev**

### Security Enhancements

- Restricted direct access to Docker server IP
- Allowed access only through the reverse proxy
- Implemented secure traffic routing through custom domain

---

## 🔁 CI/CD Workflow

1. Developer pushes code to GitHub
2. Jenkins pulls latest source code
3. Jenkins builds Docker image using Dockerfile
4. Jenkins pushes image to Docker Repository
5. GCP Docker Host pulls latest image
6. Docker container is deployed automatically
7. Azure Nginx Reverse Proxy forwards requests
8. Users access application through **grishma.dev**

---

## 🌐 Request Flow

```text
Client Browser
      │
      ▼
https://grishma.dev
      │
      ▼
Nginx Reverse Proxy (Azure VM)
      │
      ▼
Docker Host (GCP VM)
      │
      ▼
Nginx Application Container (Port 8081)
```

---

## ✅ Validation

- Website successfully accessible through **grishma.dev**
- Nginx Reverse Proxy forwards traffic correctly
- Docker container serves application on port **8081**
- Jenkins pipeline builds and deploys successfully
- New deployments automatically update the website
- Direct access to Docker Host IP is restricted
- End-to-end CI/CD pipeline functioning successfully

---

## 💡 Key Learnings

- Docker containerization fundamentals
- Creating and managing Docker images
- Writing Dockerfiles for application deployment
- Jenkins-based Docker automation
- Host-based Reverse Proxy configuration using Nginx
- Multi-cloud architecture implementation
- Traffic routing and application exposure
- Secure deployment practices
- Production-style infrastructure design
- CI/CD pipeline integration with Docker

---

## 🔒 Security Best Practices Applied

- Domain-based access using **grishma.dev**
- Reverse Proxy acting as the single entry point
- Docker Host not directly exposed to public users
- Separation of application and proxy layers
- Controlled traffic flow between cloud environments

---

## 🔗 Repository Info

- **Repo:** https://github.com/grishma2477/devOps-milestone
- **Branch:** `mile2`

---

## 🚀 Next Step

➡️ Moving to **Milestone 3: Fully Automated CI/CD Pipeline with IAC Tools**

---

## 👩‍💻 Author

**Grishma Kandel**  
Cloud & DevOps Engineer | MERN Stack Developer  
📍 Sydney, Australia

---

⭐ This milestone provided hands-on experience with **Docker, Jenkins, Nginx Reverse Proxy, multi-cloud deployments, CI/CD automation, and secure production-style application delivery**, forming the foundation for Kubernetes and cloud-native DevOps practices.