#!/bin/bash
set -e

echo "==============================================="
echo " Running JMeter distributed load test locally"
echo "==============================================="

echo "[1/3] Ensuring containers are running..."
docker-compose up -d jmeter-master jmeter-slave1 jmeter-slave2

echo "[2/3] Tail JMeter master output..."
docker logs -f jmeter-master | tee jmeter-test.log
