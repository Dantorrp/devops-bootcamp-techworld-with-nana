#!/bin/bash

# Exercise: Install Java 
# TechWorld with Nana - DevOps Bootcamp

echo "====== Installing Java ======"

# Update Package Information

sudo apt-get update 

#Install the default Java development kit

sudo apt-get install -y default-jdk

echo "===== Checking Java installation ====="

if ! command -v java &> /dev/null; then
    echo "ERROR: Java is not installed."
    exit 1
fi

# Extract the installed Java version

java_version=$(java -version 2>&1 | awk -F '"' 'NR==1 {print $2}')
major_version=$(echo "$java_version" | awk -F '.' '{if ($1 == 1) print $2; else print $1}')

echo "Detected Java version: $java_version"

# Check the installed version
if [[ ! "$major_version" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Unable to determine Java version."
    exit 1
elif [ "$major_version" -lt 11 ]; then
    echo "WARNING: Java version is lower than 11."
    exit 1
else
    echo "SUCCESS: Java version 11 or higher is installed."
    echo "Installed version: $major_version"
fi

