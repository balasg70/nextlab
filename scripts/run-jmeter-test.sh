#!/bin/bash
set -e

echo "==============================================="
echo " Running JMeter distributed load test locally"
echo "==============================================="

echo "Ensuring containers are running..."
docker-compose up -d jmeter-master jmeter-slave1 jmeter-slave2

echo "Tail JMeter master output..."
docker logs -f jmeter-master | tee jmeter-test.log

