#!/bin/bash

# Check if user has root access:
if [ "$EUID" -ne 0 ]; then
    echo "Please run as sudo/root"
    exit
fi

# Your commands here:
echo "Root access granted!"

# Get the user's name:
echo "Enter the username to create: "
read username

# Generate a random password:
password=$(openssl rand -base64 12)

# Create the user with the autogenerated password:
sudo useradd -m $username
echo "$username:$password" | sudo chpasswd

# Display the host machine details:
echo "Host Machine Details:"
echo "Hostname: $(hostname)"
echo "Kernel Version: $(uname -r)"
echo "Processor Type: $(uname -p)"

# Show the created user and password:
echo "Username: $username"
echo "Password: $password"
