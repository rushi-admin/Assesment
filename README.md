# Assessment Repo - Kubernetes + Terraform + Jenkins

This repository contains all files for the technical assessment:
- app/: Node.js app and Dockerfile
- k8s/: Kubernetes manifests and cluster setup script
- jenkins/: Jenkinsfile for CI/CD pipeline
- terraform/: Terraform root and modules
- .gitignore

**IMPORTANT:** This repo contains placeholders for credentials and AWS resource names. Do **NOT** commit secrets. Replace placeholders before use.

## Quick steps to use
1. Build & push Docker image:
```bash
cd app
docker build -t rushiadmin/assesment:latest .
docker push rushiadmin/assesment:latest
```

2. Create kind cluster and apply manifests:
```bash
chmod +x k8s/setup-cluster.sh
./k8s/setup-cluster.sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
kubectl apply -f k8s/rbac.yaml
kubectl apply -f k8s/networkpolicy.yaml
```

3. Run Jenkins pipeline (use `jenkins/Jenkinsfile`). Add credentials:
- dockerhub-creds (username/password)
- kubeconfig (kubeconfig file)
- aws-creds (for Terraform if needed)

4. Terraform:
- Create S3 bucket and DynamoDB for backend (or use separate bootstrap Terraform)
- Update `terraform/backend.tf` with your S3 bucket name and region
- Run `terraform init`, `terraform plan`, `terraform apply`

Screenshots and Grafana dashboards should be added to `/screenshots` after deployment.

