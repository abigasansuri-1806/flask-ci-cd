#!/bin/bash

echo "Deploying to staging..."

scp app.py jenkins_slave@ip-172-31-5-113:/home/jenkins_slave/staging/ 

ssh jenkins_slave@ip-172-31-5-113 << 'EOF'

    echo "Stopping existing Flask app..."
    pkill -f "python3 app.py"

    echo "Starting new Flask app on port 5000..."
    export FLASK_PORT=5000
    nohup python3 /home/jenkins_slave/staging/app.py > /home/jenkins_slave/staging/app.log 2>&1 &

EOF
