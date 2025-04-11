#!/bin/bash

echo "Deploying to production..."

# Set the environment variable
export FLASK_PORT=5001

# Copy the app to production directory locally
cp app.py /var/lib/jenkins/production/

# Kill any running instance of app.py
pkill -f "python3 /var/lib/jenkins/production/app.py"

# Restart the app in background and log output
nohup python3 /var/lib/jenkins/production/app.py > /var/lib/jenkins/production/app.log 2>&1 &
