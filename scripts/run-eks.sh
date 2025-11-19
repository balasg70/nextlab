#!/bin/bash
set -e

CLUSTER=nextlabs-perf
REGION=ap-southeast-1
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

echo "==============================================="
echo " Creating EKS cluster ($CLUSTER)"
echo "==============================================="

eksctl create cluster \
  --name $CLUSTER \
  --region $REGION \
  --with-oidc \
  --managed \
  --nodegroup-name app-ng \
  --node-type t3.medium \
  --nodes 2 --nodes-min 2 --nodes-max 5

eksctl create nodegroup \
  --cluster $CLUSTER \
  --region $REGION \
  --name jmeter-ng \
  --node-type t3.medium \
  --nodes 2 --nodes-max 10

echo "==============================================="
echo " Creating IRSA for JMeter"
echo "==============================================="

eksctl create iamserviceaccount \
  --name jmeter-irsa \
  --namespace perf-test \
  --cluster $CLUSTER \
  --attach-policy-arn arn:aws:iam::<ACCOUNT_ID>:policy/JMeterS3ReadPolicy \
  --approve \
  --override-existing-serviceaccounts

echo "==============================================="
echo " Deploying application + monitoring"
echo "==============================================="

#kubectl apply -f k8s/00-namespace.yaml
#kubectl apply -f k8s/
kubectl apply -f tmp/nextlab/eks/

echo "==============================================="
echo " Uploading JMeter test plan to S3"
echo "==============================================="

aws s3 cp jmeter/test-plan/contactform-test.jmx s3://nextlabs-jmeter-tests/

echo "==============================================="
echo " Deployment completed!"
echo ""
echo "Grafana URL (from LoadBalancer):"
kubectl get svc grafana -n perf-test

