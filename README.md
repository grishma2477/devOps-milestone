# 🚀 DevOps Capstone Project – Milestone 1

## 📌 Basic CI/CD with GitHub, Jenkins & Nginx

This milestone focuses on building a **foundational CI/CD pipeline** to deploy a static website using **GitHub, Jenkins, and Nginx**.

---

## 🎯 Goal

Establish a simple CI/CD workflow that:
- Pulls code from GitHub
- Uses Jenkins for automation
- Deploys static content to Nginx web server

---

## 🏗️ Architecture

Developer → GitHub → Jenkins (AWS EC2) → Nginx (GCP VM) → Browser

---

## ⚙️ Tech Stack

- **Jenkins** – CI Server (AWS EC2)
- **GitHub** – Code Repository
- **Nginx** – Web Server (GCP VM)
- **AWS EC2** – Jenkins Hosting
- **Google Cloud Platform (GCP)** – Web Server Hosting
- **Ubuntu 22.04 LTS** – Operating System

---

## 🔧 What I Did

- Provisioned a Jenkins server on AWS EC2
- Installed and configured Jenkins
- Created a GitHub repository for static web content
- Configured a Jenkins Freestyle Job to:
  - Pull code from GitHub
  - Copy files to `/var/www/html` on Nginx server
  - Reload Nginx
- Set up SSH authentication between Jenkins and Nginx server
- Deployed website and verified via public IP

---

## 🔁 CI/CD Workflow

1. Developer pushes code to GitHub  
2. Jenkins pulls latest code  
3. Jenkins transfers files to Nginx server  
4. Nginx serves updated website  

---

## ✅ Validation

- Website updates automatically after Jenkins run  
- Accessible via public IP  
- End-to-end pipeline working successfully  

---

## 💡 Key Learnings

- Understanding real-world CI/CD flow  
- Hands-on experience with Jenkins jobs  
- Working with multi-cloud setup (AWS + GCP)  
- Nginx deployment and configuration  
- SSH-based automation between servers  

---

## 🔗 Repository Info

- **Repo:** https://github.com/grishma2477/devOps-milestone.git  
- **Branch:** `mile-1`

---

## 🚀 Next Step

➡️ Moving to **Milestone 2: Dockerized Deployment & Reverse Proxy**

---

## 👩‍💻 Author

**Grishma Kandel**  
Cloud & DevOps Engineer | MERN Stack Developer  
📍 Sydney, Australia  

---