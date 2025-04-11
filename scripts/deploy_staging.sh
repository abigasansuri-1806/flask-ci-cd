
#!/bin/bash

echo "Deploying to staging..."

scp app.py jenkins_slave@ip-172-31-5-113:/home/jenkins/staging/
ssh jenkins@ip-172-31-5-113 'sudo systemctl restart flask-staging'



