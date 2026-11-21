#!/bin/bash

# Exercise 4: User Processes Sorted
# TechWorld with Nana - DevOps Bootcamp


echo "=================================="
echo "     USER PROCESSES SORTED"
echo "=================================="


current_user="$USER" 

echo "Current user: $current_user"
echo ""

echo "How would you like to sort processes?"
echo "1. CPU consumption"
echo "2. Memory consumption"

read -r -p "Enter your choice (1 or 2): " choice

echo "" 


if [ "$choice" == "1" ]; then 
	echo "Processes sorted by CPU usage:"
	ps aux --sort=-%cpu | grep -E "^${current_user}[[:space:]]"

elif [ "$choice" == "2" ]; then 
	echo " Processes sorted by memory usage: " 

	 ps aux --sort=-%mem | grep -E "^${current_user}[[:space:]]"

	 else
    echo "ERROR: Invalid option. Please enter 1 or 2."
    exit 1
fi

