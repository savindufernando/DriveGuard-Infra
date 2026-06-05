#!/bin/bash
set -e

echo "=== DriveGuard Docker Compose Setup ==="

# 1. CREATE 4GB SWAP FILE (helps on 1GB RAM)
echo "[1/5] Creating 4GB Swap file..."
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
sysctl vm.swappiness=60
echo "vm.swappiness=60" >> /etc/sysctl.conf

# 2. INSTALL DOCKER
echo "[2/5] Installing Docker..."
apt-get update -y
apt-get install -y docker.io docker-compose git
systemctl enable docker
systemctl start docker

# 3. CLONE THE INFRA REPO
echo "[3/5] Cloning DriveGuard-Infra repo..."
cd /opt
git clone https://github.com/savindufernando/DriveGuard-Infra.git driveguard
cd driveguard

# 4. START ALL SERVICES
echo "[4/5] Pulling and starting containers..."
docker-compose pull
docker-compose up -d

# 5. AUTO-UPDATE CRON (replaces ArgoCD GitOps)
echo "[5/5] Setting up auto-update cron job..."
cat > /opt/driveguard-update.sh << 'SCRIPT'
#!/bin/bash
cd /opt/driveguard
git pull origin master
docker-compose pull
docker-compose up -d --remove-orphans
SCRIPT
chmod +x /opt/driveguard-update.sh

# Run the update every 5 minutes (lightweight ArgoCD replacement)
echo "*/5 * * * * root /opt/driveguard-update.sh >> /var/log/driveguard-update.log 2>&1" > /etc/cron.d/driveguard-update

echo "=== DriveGuard Setup Complete! ==="
echo "Services will be available at:"
echo "  Fusion API: http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):80"
echo "  DZ API:     http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):8000"
echo "  TSR API:    http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):8001"
