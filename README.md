# Assessment Repo - Kubernetes + Terraform + Jenkins

This repository contains all files for the technical assessment:
- app/: Node.js app and Dockerfile
- k8s/: Kubernetes manifests and cluster setup script
- jenkins/: Jenkinsfile for CI/CD pipeline
- terraform/: Terraform root and modules
- .gitignore



## Quick steps to use
1. Build & push Docker image:
```bash
cd app
docker build -t rushiadmin/assesment:latest .
docker push rushiadmin/assesment:latest
```

2. Create cluster and apply manifests:


3. Run Jenkins pipeline (use `jenkins/Jenkinsfile`). Add credentials:
- dockerhub-creds (username/password)
- aws-creds (for Terraform if needed)

4. Terraform:
- Create S3 bucket and DynamoDB for backend (or use separate bootstrap Terraform)
- Update `terraform/backend.tf` with your S3 bucket name and region
- Run `terraform init`, `terraform plan`, `terraform apply`

<img width="872" height="385" alt="image" src="https://github.com/user-attachments/assets/7872d88e-a08c-458d-8bc9-2dc4559cceda" />


<img width="958" height="502" alt="image" src="https://github.com/user-attachments/assets/82313399-b5a7-47f1-97af-8d811df3f25a" />

<img width="745" height="116" alt="image" src="https://github.com/user-attachments/assets/f3d732ca-6b87-4c4c-a74f-cf7f1906cbba" />
<img width="475" height="292" alt="image" src="https://github.com/user-attachments/assets/4e53f0b8-1849-41ee-8d16-50e68e8cad47" />



<img width="950" height="463" alt="image" src="https://github.com/user-attachments/assets/4cd8e800-b31a-4fdf-a45f-1f3a79f16d46" />

<img width="956" height="306" alt="image" src="https://github.com/user-attachments/assets/a5b8accf-4199-4f15-8f4a-cd5337302e57" />

