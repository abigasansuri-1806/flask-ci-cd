
#!/bin/bash

echo "Deploying to production..."

scp app.py user@production-server:/var/www/production/

ssh user@production-server 'sudo systemctl restart flask-production'

