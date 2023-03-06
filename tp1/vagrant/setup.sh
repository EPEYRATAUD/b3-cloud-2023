#!/bin/bash

# Update the system
sudo dnf update -y

# Install Ansible and Python
sudo dnf install -y ansible python3

# Add a user with sudo privileges
sudo useradd -m ansible_user
echo "ansible_user ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/ansible_user

# SSH access
mkdir /home/ansible_user/.ssh
chmod 700 /home/ansible_user/.ssh
touch /home/ansible_user/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYrb/iNaFzOZxpY62Y0o5/uiKB8jq6GUxHbre+qMOTC2x1vcyRm6+snPbwpcIcy5XrKRmU5FbPpqjVryPXM/tGfsA4b4n5JoHhrEvHPkMQI5kMagyqjw/PSGvy3/0ers1rJUxwf2S5halFml4y56yynm53HfXPCcAMsIlD4R0WcgkttSViycioCmvHc3yzcY5ymw4GsTUjOyrZUbnAPjphRnoliGBfYnYJVPnOhWVZSRPanpuMjjWaw2VILlTO6FA+Dp4KiUFEx4eNcim9iU+llNrJTsFd4LvEyk24QQKYufSQl6aiAc2Z1pU0U++PO4i1hg0AXyFk9pA4vSKd4l+jrymZpJVWnTfAuet3RQUhVrzHHhTZZI6z8WBpg0xORMxhBf6UanST3n6/lNfgAkqyevNP4Mlne7Sx1gB+lWZmLRPNuu72jCALVLWgMIPhm33KtnhYgoT3OnGERMKjgmDl3zURl351YRrXjPiEDpvrb2YO9zNy9k72h1rCLZyOvb0= lucas@LAPTOP-JHK9K6A7" | sudo tee /home/ansible_user/.ssh/authorized_keys
chmod 600 /home/ansible_user/.ssh/authorized_keys
echo "ansible_user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible_user
chown -R ansible_user:ansible_user /home/ansible_user/.ssh

# désactive SELinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config