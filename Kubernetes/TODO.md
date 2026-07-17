# Kubernetes Learning Path & TODO List

The goal of this learning path is to understand Kubernetes (K8s) deeply by practicing both locally and on AWS, figuring out its features, and learning how to deploy, manage, and scale production-grade workloads.

---

## 🏗️ 1. Foundations & Architecture
- [ ] **Master Kubernetes Architecture**
  - [ ] Control Plane components: API Server, etcd, Scheduler, Controller Manager
  - [ ] Node components: Kubelet, Kube-proxy, Container Runtime
  - [ ] Pod lifecycle and networking basics

## ⚙️ 2. Cluster Setup & Environment
- [ ] **Local Practice Setup**
  - [ ] Set up a local cluster (e.g., Minikube, Kind, or Rancher Desktop)
- [ ] **AWS Integration**
  - [ ] Learn how to create and configure a Kubernetes cluster in AWS (Amazon EKS)
  - [ ] Understand EKS networking, IAM roles for service accounts (IRSA), and node groups

## 📄 3. Kubernetes Manifests & Workloads
- [ ] **Write Declarative YAML Manifests**
  - [ ] Pods and Namespaces
  - [ ] ReplicaSets
  - [ ] Deployments (Rolling updates, rollbacks, and histories)
  - [ ] Services (ClusterIP, NodePort, LoadBalancer)
  - [ ] Ingress resources and controllers

## 🔄 4. GitOps Integration
- [ ] **Deploy & Configure ArgoCD**
  - [ ] Install ArgoCD in the cluster
  - [ ] Set up GitOps pipelines to sync repository states with cluster states

## 📈 5. Scaling & Load Testing (HPA / VPA)
- [ ] **Autoscaling Configurations**
  - [ ] Practice **HPA (Horizontal Pod Autoscaler)** based on CPU/Memory usage
  - [ ] Practice **VPA (Vertical Pod Autoscaler)** for resource optimization
- [ ] **Load Testing & Simulation**
  - [ ] Simulate traffic and API requests (using tools like Apache Bench, Locust, or Hey) to spike CPU utilization and watch autoscaling events trigger

## 🛠️ 6. Practical Projects
- [ ] **Hands-on Deployments**
  - [ ] Run application projects using practicing Docker images
  - [ ] Configure ConfigMaps and Secrets for runtime configuration
  - [ ] Implement Persistent Volumes (PV) and Persistent Volume Claims (PVC)

## 🩺 7. Troubleshooting & Production Problems
- [ ] **Production Diagnostics & Debugging**
  - [ ] List common production issues (e.g., `CrashLoopBackOff`, `ImagePullBackOff`, `OOMKilled`, pending pods, and network policy issues)
  - [ ] Practice debugging tools: `kubectl logs`, `kubectl describe`, `kubectl exec`, and events analysis
  - [ ] Test local and AWS production troubleshooting workflows
  - [ ] Explore AI-driven debugging tools (e.g., K8sgpt or other cluster inspection helpers)
