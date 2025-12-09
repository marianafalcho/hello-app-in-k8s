# Kubernetes Deployment Project

This project automates the provisioning of a local Kubernetes environment and continuous deployment pipeline.

## Contents
```
hello-app-in-k8s/
├── app/
│   └── hello.py
│   └── requirements.txt
├── gitlab/
│   └── templates/
│   │       ├── BuildandPush.yml
├── k8s-declarative-configs/
│   └── deployment.yaml
│   └── svc.yaml
│   └── ingress.yaml
├── k8s-helm-configs/
│   ├── app/
│       ├── Chart.yaml
│       ├── values.yaml
|       └── templates/
│   │           └── deployment.yaml
│   │           └── ingress.yaml
│   │           └── service.yaml
├── terraform/
│   └── argocd.tf
│   └── argocd_app_config.yaml
│   └── kind_cluster.tf
│   └── nginx_ingress_configs.tf
│   └── nginx_ingress.tf
│   └── provider.tf
│   └── terraform.tf
├── .gitignore
├── .gitlab-ci.yml
├── Dockerfile
├── README.md
```

## Components

- **Terraform**: provisions KinD, NGINX, and ArgoCD
- **KinD**: local Kubernetes cluster
- **NGINX**: ingress controller
- **ArgoCD**: GitOps deployment
- **Helm**: deploys application to Kubernetes
- **GitLab CI**: builds and pushes images to DockerHub


## Workflow

***hello-app-in-k8s/***

Root directory of the project. Contains all application code, Kubernetes configurations, Terraform scripts, CI/CD pipelines, and documentation.

**app/**

Contains the application code and its dependencies.

`hello.py` → The main Python application file (example: a simple web server).

`requirements.txt` → Lists Python dependencies for the app.

***gitlab/templates/***

Holds reusable GitLab CI/CD templates.

`BuildandPush.yml` → GitLab CI template for building Docker images and pushing them to a container registry. Likely used as an include in .gitlab-ci.yml.

***k8s-declarative-configs/***

Stores raw Kubernetes manifests (YAML) for direct `kubectl apply` deployments.

`deployment.yaml` → Kubernetes Deployment definition for the app.

`svc.yaml` → Service definition exposing the app.

`ingress.yaml` → Ingress resource to route external traffic to the app (e.g., through NGINX).

***k8s-helm-configs/***

Contains Helm charts for deploying applications in a more reusable, templated way.

*app/*→ Helm chart for the app.

`Chart.yaml` → Metadata about the Helm chart (name, version, etc.).

`values.yaml `→ Default configuration values for templates.

*templates/* → Templated Kubernetes manifests:

`deployment.yaml` → Deployment template.

`ingress.yaml` → Ingress template.

`service.yaml` → Service template.

Helm allows parameterized deployments, making it easy to reuse and override configs.

***terraform/***

Terraform scripts to provision infrastructure, particularly local Kubernetes with KinD, NGINX ingress, and ArgoCD.

`provider.tf` → Configures Terraform provider(s).

`terraform.tf `→ Main Terraform settings (backend, variables, etc.).

`kind_cluster.tf `→ Creates a KinD (Kubernetes in Docker) cluster.

`nginx_ingress.tf` → Deploys NGINX ingress controller.

`nginx_ingress_configs.tf` → Additional NGINX configurations (e.g., ingress rules).

`argocd.tf `→ Deploys ArgoCD to the cluster.

`argocd_app_config.yaml` → ArgoCD application configuration (links Git repo/Helm chart for GitOps).

***.gitlab-ci.yml*** → GitLab CI pipeline orchestrating image build, push, and deployment.

***Dockerfile*** → Builds a Docker image for the hello.py app.


**Summary**

Code & Docker: app/ + Dockerfile → build image.

CI/CD: .gitlab-ci.yml + gitlab/templates/BuildandPush.yml → build and push images.

Kubernetes Deployment:

k8s-declarative-configs/ → raw kubectl apply approach (optional/manual).

k8s-helm-configs/ → Helm templated deployments.

Infrastructure Provisioning: terraform/ → sets up KinD cluster, NGINX, and ArgoCD for GitOps.

GitOps: ArgoCD monitors Helm charts or declarative configs and synchronizes the cluster state.