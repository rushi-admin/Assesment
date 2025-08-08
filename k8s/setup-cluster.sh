#!/usr/bin/env bash
set -euo pipefail
CLUSTER_NAME="dev-cluster"

if ! command -v kind >/dev/null; then
  echo "kind not installed. Install from https://kind.sigs.k8s.io/"
  exit 1
fi

if kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
  echo "cluster ${CLUSTER_NAME} already exists"
else
  cat <<EOF | kind create cluster --name ${CLUSTER_NAME} --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF
fi

kubectl wait --for=condition=Ready nodes --all --timeout=120s
kubectl get nodes
