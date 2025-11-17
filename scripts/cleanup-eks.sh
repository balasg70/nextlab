#!/bin/bash
set -e

CLUSTER=nextlabs-perf
REGION=ap-southeast-1

echo "==============================================="
echo "Deleting Kubernetes resources"
echo "==============================================="

kubectl delete namespace perf-test --ignore-not-found=true

echo "==============================================="
echo "Deleting EKS cluster"
echo "==============================================="

eksctl delete cluster --name $CLUSTER --region $REGION

echo "==============================================="
echo "Deleting S3 test files"
echo "==============================================="

aws s3 rm s3://nextlabs-jmeter-tests --recursive

echo "Cleanup completed."
