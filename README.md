# nextlabs-performance-assignment (FULL)

This repository contains a complete runnable local Docker Compose stack and Kubernetes/EKS manifests to:
- Run a Spring Boot contact-form API backed by PostgreSQL
- Run distributed JMeter (master + slave) to simulate 100+ users
- Export JMeter metrics via Prometheus plugin and visualize in Grafana
- EKS manifests include IRSA ServiceAccount example for JMeter to pull test plans from S3

## Requirementto to have docker and docker compsed loaded in a Host to do demo

## Quick local run (Docker Compose)

1. Clone Spring app (if not present) and build jar:
   git clone https://github.com/Clifftech123/spring-crud-docker.git app/src
   cd app
   mvn clean package -DskipTests
   cp target/*.jar ../app/target/spring-crud-docker.jar
   cd ..

2. Start stack:
   docker-compose up --build -d

3. Confirm services:
   - Spring API: http://localhost:8080
   - Grafana: http://localhost:3000 (admin/admin)
   - Prometheus: http://localhost:9090

4. Run distributed test (master auto-runs when container starts if test plan present):
   docker logs -f jmeter-master

## EKS notes
- Update eks/cluster.yaml with desired region and node sizes
- Create IAM policy (eks/iam-policy.json) and IRSA role; annotate ServiceAccount in eks/jmeter-irsa.yaml
- Upload test plan to S3 and use initContainer pattern or aws-cli in jmeter start script to download

## Demo script
See the 'scripts' folder for upload helper. Use kubectl logs and kubectl get hpa -w during screen recording.

