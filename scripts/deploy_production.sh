#!/bin/bash

echo "Deploying to production..."

# Copy the app to production directory locally
cp app.py /var/lib/jenkins/production/

# Kill any running instance of app.py
pkill -f "python3 /var/lib/jenkins/production/app.py"

# Set the port to 5001 and restart the app in background and log output
export FLASK_PORT=5001
nohup python3 /var/lib/jenkins/production/app.py > /var/lib/jenkins/production/app.log 2>&1 &
