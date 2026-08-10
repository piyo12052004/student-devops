# 🚀 Student DevOps Journey

> My learning journey to becoming a DevOps Engineer.

![DevOps](https://img.shields.io/badge/DevOps-Learning-blue)
![Linux](https://img.shields.io/badge/Linux-Completed-success)
![Docker](https://img.shields.io/badge/Docker-Completed-success)
![Terraform](https://img.shields.io/badge/Terraform-Completed-success)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Completed-success)
![GCP](https://img.shields.io/badge/GCP-Completed-success)

---

## 👋 About

Hi, I'm **Piyo Aswandi**.

This repository documents my journey of learning and practicing **DevOps Engineering** through hands-on labs, projects, infrastructure automation, CI/CD pipelines, cloud infrastructure, containerization, Kubernetes, and monitoring.

My goal is to build practical skills in designing, deploying, automating, and monitoring modern applications and infrastructure.

This repository is continuously updated as I learn, experiment, and build new projects.

---

# 🗂️ Repository Branches

> **Choose a branch to explore the topic you want to learn.**

| Branch       | Description                                                   |
| ------------ | ------------------------------------------------------------- |
| `linux`      | Linux fundamentals, administration, and server management     |
| `git`        | Git & GitHub fundamentals and workflows                       |
| `docker`     | Docker, Dockerfile, images, containers, networks, and volumes |
| `ci-cd`      | CI/CD with Jenkins and GitHub Actions                         |
| `terraform`  | Infrastructure as Code with Terraform                         |
| `gcp`        | Google Cloud infrastructure and services                      |
| `kubernetes` | Kubernetes fundamentals and application deployment            |
| `monitoring` | Prometheus, Grafana, Loki, and monitoring                     |
| `projects`   | End-to-end DevOps projects                                    |

---

# 🎯 DevOps Learning Roadmap

## ✅ Linux

Fundamentals of Linux server administration.

### Topics

* File System
* File & Directory Management
* Users & Groups
* File Permissions
* SSH
* Bash Scripting
* Process Management
* `systemctl`
* Package Management
* Environment Variables
* Networking Commands
* Server Administration

**Status: Completed ✅**

---

## ✅ Networking

Understanding the fundamentals of computer networking.

### Topics

* IP Address
* Subnet
* CIDR
* TCP/IP
* TCP & UDP
* Ports
* DNS
* HTTP / HTTPS
* NAT
* Routing
* Firewall
* Reverse Proxy

**Status: Completed ✅**

---

## ✅ Git & GitHub

Version control and collaborative development workflow.

### Topics

* Git Fundamentals
* Repository
* Commit
* Branch
* Merge
* Rebase
* Conflict Resolution
* Remote Repository
* Pull Request
* GitHub Workflow
* `.gitignore`
* Tags

**Status: Completed ✅**

---

## ✅ Bash & Python

Basic scripting and automation.

### Topics

* Bash Fundamentals
* Shell Variables
* Conditions
* Loops
* Functions
* Shell Scripts
* Linux Automation
* Python Fundamentals
* Automation Scripts

**Status: Completed ✅**

---

## ✅ Nginx

Web server and reverse proxy fundamentals.

### Topics

* Nginx Installation
* Server Block
* Reverse Proxy
* Static Files
* HTTP / HTTPS
* SSL
* Domain Configuration

**Status: Completed ✅**

---

## ✅ Docker

Containerization fundamentals.

### Topics

* Docker Installation
* Docker CLI
* Images
* Containers
* Container Lifecycle
* Volumes
* Networks
* Dockerfile
* Docker Compose
* Environment Variables
* Multi-stage Build
* Container Optimization

**Status: Completed ✅**

---

## ✅ CI/CD

Continuous Integration and Continuous Deployment.

### Technologies

* Jenkins
* GitHub Actions
* Docker
* GitHub Webhook
* Pipeline
* Automated Build
* Automated Testing
* Docker Image Build
* Deployment Automation

### Example Pipeline

```text
GitHub
   ↓
Webhook
   ↓
Jenkins / GitHub Actions
   ↓
Build
   ↓
Test
   ↓
Docker Build
   ↓
Docker Registry
   ↓
Deploy
```

**Status: Completed ✅**

---

## ✅ Google Cloud Platform

Cloud infrastructure using **Google Cloud Platform (GCP)**.

### Topics

* Compute Engine
* VPC
* Subnet
* Firewall
* Cloud NAT
* Cloud Router
* Cloud Storage
* Cloud SQL
* Cloud DNS
* Load Balancer
* Managed Instance Group
* Autoscaling
* IAM
* GKE

**Status: Completed ✅**

---

## ✅ Terraform

Infrastructure as Code for provisioning and managing cloud infrastructure.

### Topics

* Infrastructure as Code
* Terraform CLI
* Providers
* Resources
* Variables
* Outputs
* Data Sources
* Modules
* State
* Remote State
* Backend
* Terraform Plan
* Terraform Apply
* Terraform Destroy
* GCP Infrastructure

### Infrastructure

```text
Terraform
    │
    ├── VPC
    ├── Subnet
    ├── Firewall
    ├── Compute Engine
    ├── Cloud NAT
    ├── Cloud SQL
    ├── Cloud Storage
    ├── Cloud DNS
    ├── Load Balancer
    ├── MIG
    ├── Autoscaling
    └── GKE
```

**Status: Completed ✅**

---

## ✅ Kubernetes

Container orchestration using Kubernetes.

### Topics

* Kubernetes Architecture
* Cluster
* Node
* Pod
* ReplicaSet
* Deployment
* Service
* ClusterIP
* NodePort
* LoadBalancer
* ConfigMap
* Secret
* Namespace
* Readiness Probe
* Persistent Volume
* Persistent Volume Claim
* Ingress
* Horizontal Pod Autoscaler
* GKE

### Application Flow

```text
Internet
   ↓
Ingress
   ↓
Service
   ↓
Deployment
   ↓
Pods
```

**Status: Completed ✅**

---

## ✅ Monitoring & Observability

Monitoring infrastructure, containers, and applications.

### Technologies

* Prometheus
* Grafana
* Loki
* Node Exporter

### Monitoring Stack

```text
Infrastructure
      │
      ├── Metrics ──→ Prometheus
      │                   │
      │                   ▼
      │                Grafana
      │
      └── Logs ──────→ Loki
```

**Status: Completed ✅**

---

# 🔄 Current Focus

Although the fundamental technologies have been studied, the next stage is to combine everything into **end-to-end production-like projects**.

### Current focus:

* Kubernetes on GCP
* GKE
* Terraform + GCP
* CI/CD + Kubernetes
* Containerized Laravel applications
* PostgreSQL
* Monitoring
* Infrastructure automation
* Troubleshooting
* Production-ready deployment practices

---

# 🏗️ Main DevOps Project

The main goal is to build an end-to-end deployment platform using:

```text
Laravel
   │
   ▼
Docker
   │
   ▼
GitHub
   │
   ▼
CI/CD
   │
   ▼
Docker Image
   │
   ▼
Artifact Registry
   │
   ▼
GKE
   │
   ├── Deployment
   ├── Service
   ├── ConfigMap
   ├── Secret
   └── Ingress
   │
   ▼
Cloud SQL
   │
   ▼
PostgreSQL
```

Infrastructure will be provisioned using:

```text
Terraform
    │
    ├── VPC
    ├── Subnet
    ├── Firewall
    ├── GKE
    ├── Cloud SQL
    ├── Artifact Registry
    └── IAM
```

Monitoring:

```text
GKE
 │
 ├── Prometheus
 ├── Grafana
 └── Loki
```

---

# 📁 Repository Structure

```text
student-devops/
│
├── linux/
│   ├── notes/
│   ├── commands/
│   └── labs/
│
├── git/
│   ├── notes/
│   ├── commands/
│   └── labs/
│
├── docker/
│   ├── notes/
│   ├── dockerfile/
│   ├── compose/
│   └── labs/
│
├── ci-cd/
│   ├── jenkins/
│   └── github-actions/
│
├── terraform/
│   ├── notes/
│   ├── modules/
│   └── gcp/
│
├── gcp/
│   ├── compute-engine/
│   ├── networking/
│   ├── cloud-sql/
│   ├── load-balancer/
│   └── gke/
│
├── kubernetes/
│   ├── pods/
│   ├── deployments/
│   ├── services/
│   ├── configmap/
│   ├── secrets/
│   ├── ingress/
│   └── autoscaling/
│
├── monitoring/
│   ├── prometheus/
│   ├── grafana/
│   └── loki/
│
├── projects/
│   ├── laravel-docker/
│   ├── laravel-gke/
│   └── end-to-end-devops/
│
└── README.md
```

---

# 🛠️ Technologies

### Operating System

* Linux
* Ubuntu Server

### Version Control

* Git
* GitHub

### Containerization

* Docker
* Docker Compose

### CI/CD

* Jenkins
* GitHub Actions

### Cloud

* Google Cloud Platform
* GKE
* Compute Engine
* Cloud SQL
* Cloud Storage
* VPC
* Load Balancer
* Cloud DNS

### Infrastructure as Code

* Terraform

### Container Orchestration

* Kubernetes

### Monitoring & Logging

* Prometheus
* Grafana
* Loki
* Node Exporter

### Web Server

* Nginx
* Apache

### Scripting

* Bash
* Python

---

# 📚 Learning Resources

I use official documentation, technical articles, hands-on labs, and real-world projects as learning resources.

Recommended documentation:

* Linux Documentation
* Git Documentation
* Docker Documentation
* Jenkins Documentation
* GitHub Actions Documentation
* Terraform Documentation
* Google Cloud Documentation
* Kubernetes Documentation
* Prometheus Documentation
* Grafana Documentation

---

# 🎯 Goals

### Technical Goals

* Build Infrastructure as Code
* Automate infrastructure provisioning
* Build reliable CI/CD pipelines
* Containerize applications
* Deploy applications to Kubernetes
* Manage Kubernetes workloads
* Deploy infrastructure on GCP
* Implement monitoring and logging
* Improve troubleshooting skills
* Apply DevOps best practices

### Career Goal

> Become a professional DevOps Engineer with strong practical skills in cloud infrastructure, automation, containerization, CI/CD, Kubernetes, and observability.

---

# 📈 Learning Progress

| Technology     | Status      |
| -------------- | ----------- |
| Linux          | ✅ Completed |
| Networking     | ✅ Completed |
| Git & GitHub   | ✅ Completed |
| Bash           | ✅ Completed |
| Python         | ✅ Completed |
| Nginx          | ✅ Completed |
| Docker         | ✅ Completed |
| Docker Compose | ✅ Completed |
| Jenkins        | ✅ Completed |
| GitHub Actions | ✅ Completed |
| GCP            | ✅ Completed |
| Terraform      | ✅ Completed |
| Kubernetes     | ✅ Completed |
| Prometheus     | ✅ Completed |
| Grafana        | ✅ Completed |
| Loki           | ✅ Completed |
| Ansible        | 🔜 Next     |
| Helm           | 🔜 Next     |
| GitOps         | 🔜 Next     |
| DevSecOps      | 🔜 Next     |

---

# 📝 Learning Method

Every topic is practiced through:

* 📖 Learning Notes
* 💻 Commands
* 🧪 Hands-on Labs
* 🏗️ Projects
* 🔧 Troubleshooting
* 📚 Documentation
* ✅ Best Practices

The goal is not only to understand how a technology works, but also to understand **why it is used, how it integrates with other technologies, and how to troubleshoot it when something goes wrong.**

---

# 🚀 DevOps Journey

```text
Linux
  ↓
Networking
  ↓
Git & GitHub
  ↓
Bash + Python
  ↓
Nginx
  ↓
Docker
  ↓
Docker Compose
  ↓
CI/CD
  ↓
GCP
  ↓
Terraform
  ↓
Kubernetes
  ↓
Monitoring
  ↓
Production-like Projects
  ↓
DevSecOps / GitOps
```

---

## ⭐ About This Repository

This repository is a personal learning journey and a collection of hands-on experiments while studying DevOps Engineering.

It will continue to evolve as I learn new technologies, build new projects, and gain more experience.

**Learn → Practice → Build → Troubleshoot → Improve.**

⭐ If you find this repository useful, feel free to star the repository.

**Happy Learning & Keep Building! 🚀**
