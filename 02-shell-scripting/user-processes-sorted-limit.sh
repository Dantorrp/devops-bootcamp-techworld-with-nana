
#!/bin/bash

# Exercise 5: Number of User Processes Sorted
# TechWorld with Nana - DevOps Bootcamp

echo "======================================"
echo "     USER PROCESS MONITORING TOOL"
echo "======================================"

current_user="$USER"

echo "Current user: $current_user"
echo ""

echo "Select sorting criteria:"
echo "1. CPU consumption"
echo "2. Memory consumption"

read -r -p "Enter your choice (1 or 2): " choice

echo ""

# Validate sorting option
if [ "$choice" == "1" ]; then
    sort_option="-%cpu"
    sort_name="CPU"

elif [ "$choice" == "2" ]; then
    sort_option="-%mem"
    sort_name="Memory"

else
    echo "ERROR: Invalid sorting option."
    exit 1
fi

# Ask how many processes to display
read -r -p "How many processes would you like to display? " process_count

# Validate the number
if [[ ! "$process_count" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: Please enter a positive integer."
    exit 1
fi

echo ""
echo "======================================"
echo "Top $process_count processes by $sort_name"
echo "======================================"

# Display the sorted processes
ps aux --sort="$sort_option" |
    grep -E "^${current_user}[[:space:]]" |
    head -n "$process_count"

