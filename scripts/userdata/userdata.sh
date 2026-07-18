#!/bin/bash
set -euxo pipefail

# Log all output
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

export DEBIAN_FRONTEND=noninteractive

echo "===== Starting User Data Execution ====="

# Update system
apt-get update -y
# apt-get upgrade -y

# Install required packages
apt-get install -y \
    ansible \
    git \
    python3 \
    python3-pip \
    python3-venv \
    openssh-client \
    unzip \
    zip \
    curl \
    wget \
    jq \
    tree \
    vim \
    net-tools \
    software-properties-common

# Install Ansible collections
ansible-galaxy collection install \
    amazon.aws \
    community.aws \
    ansible.windows \
    community.windows \
    community.general

# Create working directories
mkdir -p /opt/ansible/{inventory,playbooks,roles,collections}
chmod -R 755 /opt/ansible

# Display versions
echo "===== Installed Versions ====="
ansible --version
python3 --version
git --version

echo "===== User Data Completed Successfully ====="