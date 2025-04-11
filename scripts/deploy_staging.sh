
#!/bin/bash

echo "Deploying to staging..."

scp app.py user@staging-server:/var/www/staging/

ssh user@staging-server 'sudo systemctl restart flask-staging'

