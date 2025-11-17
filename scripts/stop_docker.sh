#!/bin/bash
set -e

echo "==============================================="
echo " Shutting down and cleaning resources"
echo "==============================================="

docker-compose down -v

echo "All containers removed, volumes cleaned."
