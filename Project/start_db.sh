#!/bin/bash

echo "🚀 Starting PostgreSQL Database in Docker..."

# Step 1: Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "❌ Docker is not installed! Please install Docker first."
    exit 1
fi

# Step 2: Pull PostgreSQL Image (if not already pulled)
docker pull postgres:15

# Step 3: Run the database with Docker Compose (if exists)
if [ -f "docker-compose.yml" ]; then
    echo "📂 Found docker-compose.yml, starting database..."
    docker-compose up -d
else
    echo "⚠ No docker-compose.yml found. Running PostgreSQL manually..."
    docker run -d \
        --name easy_translate_db \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_PASSWORD=12345 \
        -e POSTGRES_DB=easy_translate \
        -p 5433:5432 \
        -v "pg_data:/var/lib/postgresql/data" \
        postgres:15
fi

# Step 4: Show connection details
echo "✅ Database started successfully!"
echo "🔗 Connect using:"
echo "   Host: localhost"
echo "   Port: 5433"
echo "   User: postgres"
echo "   Password: 12345"
echo "   Database: easy_translate"

exit 0

