#!/bin/bash
set -e

echo "==============================================="
echo " Starting distributed JMeter load test on EKS"
echo "==============================================="

echo "Checking jmeter-master logs..."
kubectl logs -f deploy/jmeter-master -n perf-test | tee eks-jmeter-test.log


#kubectl scale deploy jmeter-worker -n perf-test --replicas=6
