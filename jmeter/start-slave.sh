#!/bin/bash
set -e
echo "Starting JMeter slave (server)..."
/opt/jmeter/bin/jmeter-server -Dserver.rmi.localport=60000 -Dserver.rmi.port=60000
