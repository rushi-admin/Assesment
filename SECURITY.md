# Security Summary

- Dockerfile runs app as non-root user and includes HEALTHCHECK.
- Image scanning integrated in Jenkins pipeline via trivy.
- Kubernetes RBAC: `jenkins-deployer` role with least privilege to update deployments and read services/pods.
- NetworkPolicy: basic deny-from-outside example to restrict pod ingress.
- Secrets: use Kubernetes Secrets or SealedSecrets (recommended for public repo).
- Terraform state: backend configured to S3 with encryption and DynamoDB for locking (update placeholders).
