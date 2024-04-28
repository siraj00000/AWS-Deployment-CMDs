#!/bin/bash

# Stopping and deleting the PM2 process
echo "Stopping PM2 process..."
pm2 stop 0
pm2 delete 0

# Removing old directories
echo "Removing old directories..."
sudo rm -rf <repo-folder-name>
sudo rm -rf current
sudo rm -rf source

# Cloning the repository - Replace <URL> with your repository URL
# Ensure you've set up Git SSH or credential caching if you're not embedding the PAT directly
echo "Cloning repository..."
git clone https://<github_access_token>@github.com/<repo_name>

# Installing dependencies
echo "Installing npm dependencies..."
cd <repo-folder-name> || exit
npm install

# Copy the .env into repo folder
# check command 

# Starting the app with PM2
echo "Starting the app with PM2..."
pm2 start app.js
pm2 save

echo "Deployment completed successfully."