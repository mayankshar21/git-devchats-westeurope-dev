#!/bin/bash

# Update package list and install Nginx
sudo apt update
sudo apt install -y nginx

# Create a directory for the static application page
sudo mkdir -p /var/www/static_app

# Create a sample index.html file
echo "<html>
<head>
    <title>Welcome to Nginx!</title>
</head>
<body>
    <h1>Success! The Nginx server 2 is working!</h1>
</body>
</html>" | sudo tee /var/www/static_app/index.html

# Set up Nginx configuration to serve the static application page
sudo bash -c 'cat > /etc/nginx/sites-available/static_app <<EOF
server {
    listen 8080;
    server_name _;

    root /var/www/static_app;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF'

# Enable the new configuration by creating a symbolic link
sudo ln -s /etc/nginx/sites-available/static_app /etc/nginx/sites-enabled/

# Test Nginx configuration and restart the service
sudo nginx -t && sudo systemctl restart nginx

echo "Nginx has been installed and configured to serve the static application page from /home/azureuser/static_app"
