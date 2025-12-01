#!/bin/bash
set -e

echo "==============================================="
echo "  NEXTLABS PERFORMANCE TEST – END-TO-END SETUP "
echo "==============================================="

PROJECT_ROOT=$(pwd)
APP_DIR="$PROJECT_ROOT/nextlab/app"
TARGET_JAR="$APP_DIR/app.jar"

echo "Cleaning old build artefacts..."
rm -f "$TARGET_JAR"
rm -rf /tmp/spring-crud-docker

echo "Cloning Spring Boot GitHub repository..."
git clone https://github.com/Clifftech123/spring-crud-docker /tmp/spring-crud-docker

echo "Building Spring Boot application with Maven..."
cd /tmp/spring-crud-docker
./mvnw clean package -DskipTests

echo "Copying built JAR into docker-compose/app directory..."
cp target/*.jar "$TARGET_JAR"

echo "Returning to project root..."
#cd "$PROJECT_ROOT"
cd /tmp/nextlab

echo "Building Docker images..."
docker-compose build

echo "Starting all containers..."
docker-compose up -d

echo "Checking container status..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "==============================================="
echo " ALL SERVICES ARE UP "
echo "==============================================="
echo "Spring API:     http://localhost:8080/api/contacts"
echo "Grafana:         http://localhost:3000 (admin/admin)"
echo "Prometheus:      http://localhost:9090"
echo "PostgreSQL:      localhost:5432 (admin/admin123)"
echo ""
echo "To run JMeter Master manually:"
echo "  docker logs -f jmeter-master"
echo ""
echo "To stop everything:"
echo "  docker-compose down -v"
echo ""
echo "Setup complete!"



