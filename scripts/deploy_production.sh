
#!/bin/bash

echo "Deploying to production..."

scp app.py jenkins@ip-172-31-5-113:/var/lib/jenkins/production/

ssh jenkins@ip-172-31-5-113<< 'EOF'

    pkill -f "python3 app.py"

    nohup python3 /var/lib/jenkins/production/app.py > /var/lib/jenkins/production/app.log 2>&1 &

EOF
