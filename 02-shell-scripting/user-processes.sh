
#!/bin/bash

# Exercise 3: User Processes
# TechWorld with Nana - DevOps Bootcamp

echo "====================================="
echo "      CURRENT USER PROCESSES"
echo "====================================="

# Get current user from environment variable
current_user="$USER"

echo "Current user: $current_user"
echo ""
echo "Processes running for $current_user:"
echo ""

# Display processes belonging to current user
ps aux | grep "^${current_user}[[:space:]]"
    
