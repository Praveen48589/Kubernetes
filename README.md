# KIND — Kubernetes IN Docker on Linux

> **Run local Kubernetes clusters using Docker containers as nodes.**  
> KIND is ideal for local development, CI pipelines, and testing Kubernetes configurations without a cloud provider.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Step 1 — Install Docker](#step-1--install-docker)
  - [Step 2 — Configure Docker Permissions](#step-2--configure-docker-permissions)
  - [Step 3 — Install kubectl](#step-3--install-kubectl)
  - [Step 4 — Install KIND](#step-4--install-kind)
- [Create Your First Cluster](#create-your-first-cluster)
- [Cluster Configuration](#cluster-configuration)
  - [Single-Node Cluster](#single-node-cluster)
  - [Multi-Node Cluster](#multi-node-cluster)
  - [Cluster with Port Mapping](#cluster-with-port-mapping)
- [Common Operations](#common-operations)
- [Troubleshooting](#troubleshooting)
- [Uninstall](#uninstall)
- [Resources](#resources)

---

## Overview

**KIND** (Kubernetes IN Docker) is an official Kubernetes SIG (Special Interest Group) tool that uses Docker containers as Kubernetes nodes. It was originally designed for testing Kubernetes itself but is now widely used for local development and CI workflows.

| Feature | Detail |
|---|---|
| **Platform** | Linux (amd64, arm64) |
| **Minimum Docker** | 20.10+ |
| **Minimum kubectl** | Compatible with your target K8s version |
| **Cluster startup time** | ~1–2 minutes |

---

## Architecture

```
┌─────────────────────────────────────────────┐
│                Linux Host                   │
│                                             │
│   ┌─────────────┐    ┌─────────────────┐    │
│   │   kubectl   │───▶│   KIND CLI      │    │
│   └─────────────┘    └────────┬────────┘    │
│                               │             │
│              ┌────────────────▼──────────┐  │
│              │        Docker Engine       │  │
│              │                           │  │
│              │  ┌──────────┐  ┌───────┐  │  │
│              │  │ Control  │  │Worker │  │  │
│              │  │  Plane   │  │ Node  │  │  │
│              │  │(container│  │(cont.)│  │  │
│              │  └──────────┘  └───────┘  │  │
│              └───────────────────────────┘  │
└─────────────────────────────────────────────┘
```

---

## Prerequisites

Before starting, ensure your Linux system meets the following requirements:

- **OS**: Ubuntu 20.04+ / Debian 11+ / RHEL 8+ or equivalent
- **RAM**: Minimum 2 GB free (4 GB+ recommended for multi-node clusters)
- **Disk**: At least 10 GB free
- **Tools**: `curl`, `sudo` access

---

## Installation

### Step 1 — Install Docker

If Docker is not already installed, set it up and enable it as a system service:

```bash
# Install Docker (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install -y docker.io

# Start and enable Docker to run on boot
sudo systemctl start docker
sudo systemctl enable docker
```

Verify Docker is running:

```bash
docker --version
# Expected output: Docker version 24.x.x, build xxxxxxx

sudo systemctl status docker
# Expected output: Active: active (running)
```

---

### Step 2 — Configure Docker Permissions

Add your user to the `docker` group to run Docker commands without `sudo`:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

> **Important:** If `newgrp docker` does not apply the change to your current session, log out and log back in. On some systems, a full reboot may be required.

Confirm Docker works as your non-root user:

```bash
docker run hello-world
```

Expected output should include:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

---

### Step 3 — Install kubectl

`kubectl` is the Kubernetes command-line tool used to interact with your cluster.

**Download the latest stable release:**

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

**Validate the binary (recommended):**

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
# Expected output: kubectl: OK
```

**Install kubectl:**

```bash
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

**Verify the installation:**

```bash
kubectl version --client
# Expected output: Client Version: v1.xx.x
```

---

### Step 4 — Install KIND

**Download the latest KIND binary:**

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
```

> **Note for ARM64 systems**, use:
> ```bash
> curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-arm64
> ```

**Install KIND:**

```bash
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

**Verify the installation:**

```bash
kind --version
# Expected output: kind v0.x.x go1.x.x linux/amd64
```

---

## Create Your First Cluster

Create a default single-node cluster:

```bash
kind create cluster
```

KIND will pull the node image, configure the control plane, and update your kubeconfig automatically.

Verify the cluster is running:

```bash
kubectl cluster-info --context kind-kind
kubectl get nodes
```

Expected output:

```
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   1m    v1.xx.x
```

---

## Cluster Configuration

KIND supports a YAML-based configuration file for advanced setups.

### Single-Node Cluster

```yaml
# single-node.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: dev-cluster
```

```bash
kind create cluster --config single-node.yaml
```

---

### Multi-Node Cluster

```yaml
# multi-node.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: ha-cluster
nodes:
  - role: control-plane
  - role: worker
  - role: worker
```

```bash
kind create cluster --config multi-node.yaml
```

---

### Cluster with Port Mapping

Useful when running services that need to be accessible from the host machine:

```yaml
# port-mapping.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: app-cluster
nodes:
  - role: control-plane
    extraPortMappings:
      - containerPort: 30080
        hostPort: 8080
        protocol: TCP
```

```bash
kind create cluster --config port-mapping.yaml
```

---

