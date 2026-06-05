#!/bin/bash
set -e

echo "Starting DriveGuard K3s Setup..."

# 1. CREATE 6GB SWAP FILE (CRITICAL FOR ML ON 1GB RAM)
echo "Creating 6GB Swap file..."
fallocate -l 6G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

# Make swap permanent across reboots
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

# Tweak swappiness to encourage swapping before OOM kill
sysctl vm.swappiness=60
echo "vm.swappiness=60" >> /etc/sysctl.conf

# 2. INSTALL K3S
echo "Installing K3s Lightweight Kubernetes..."
# Configure K3s to allow NodePorts starting from 8000
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --kube-apiserver-arg=service-node-port-range=8000-32767" sh -

# Wait for K3s to be ready
sleep 15
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# 3. INSTALL ARGO CD
echo "Installing Argo CD..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Expose Argo CD Server as a NodePort on Port 8080 (Matches our Terraform Security Group)
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort", "ports": [{"port": 80, "targetPort": 8080, "nodePort": 8080}]}}'

echo "DriveGuard GitOps Setup Complete!"
