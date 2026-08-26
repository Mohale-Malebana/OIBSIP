#!/bin/bash  

 # UFW Firewall Configuration Script 
 # Purpose: Configure a basic Linux firewall using UFW   

 echo "Starting UFW firewall configuration..."    

# Set default policies   
 sudo ufw default deny incoming 
 sudo ufw default allow outgoing  

# Allow SSH  
sudo ufw allow 22/tcp  

# Deny HTTP  
sudo ufw deny 80/tcp  

# Allow HTTPS  
sudo ufw allow 443/tcp  

# Deny telnet  
sudo ufw deny 23/tcp

# Enable UFW 
sudo ufw --force enable  

# Display firewall status  
sudo ufw status verbose

echo "UFW configuration completed."
