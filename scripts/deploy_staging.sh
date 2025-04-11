
#!/bin/bash

echo "Deploying to staging..."

scp app.py jenkins_slave@ip-172-31-5-113:/home/jenkins_slave/staging/ 

ssh jenkins_slave@ip-172-31-5-113<< 'EOF'

    pkill -f "python3 app.py"

    nohup python3 /home/jenkins_slave/staging/app.py > /home/jenkins_slave/staging/app.log 2>&1 &

EOF








