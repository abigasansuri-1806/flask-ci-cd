
#!/bin/bash

echo "Deploying to production..."

scp app.py jenkins@ip-172-31-5-113:/var/lib/jenkins/production/

ssh jenkins@ip-172-31-5-113 'sudo systemctl restart flask-production'

