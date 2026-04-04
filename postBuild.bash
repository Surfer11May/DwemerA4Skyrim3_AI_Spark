#!/bin/bash
# This file contains bash commands that will be executed at the end of the container build process,
# after all system packages and programming language specific package have been installed.
#
# Note: This file may be removed if you don't need to use it

# Ensure we have write access to /project directory
if [ ! -w "/project" ]; then
    echo "Directory /project is not writable, fixing ownership..."
    sudo chown -R $(id -u):$(id -g) /project
fi

# Create a virtual environment with Python 3.10, using system site packages for apt-installed Python packages
if [ -d "/project/venv" ]; then
    rm -rf /project/venv
fi
python3.10 -m venv --system-site-packages /project/venv
# Install requirements into the virtual environment
/project/venv/bin/pip install -r "/project/requirements.txt"
