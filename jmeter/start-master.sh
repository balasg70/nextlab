#!/bin/bash
set -e
# Start in server mode to accept RMI? For master we run controller which connects to slaves
# Ensure slaves are ready (basic wait loop)
echo "Starting JMeter master controller..."
ls /tests || true
# Run in non-GUI distributed mode. -R uses slave hostnames as provided in docker-compose (jmeter-slave)
if [ -f "/tests/contactform-test.jmx" ]; then
  echo "Found test plan. Running distributed test..."
  /opt/jmeter/bin/jmeter -n -t /tests/contactform-test.jmx -l /results/result.jtl -R jmeter-slave
else
  echo "No test plan found at /tests/contactform-test.jmx. Starting jmeter in GUI mode disabled, exiting."
  sleep 3600
fi
