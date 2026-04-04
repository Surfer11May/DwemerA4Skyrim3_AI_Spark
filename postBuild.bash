#!/bin/bash
# This file contains bash commands that will be executed at the end of the container build process,
# after all system packages and programming language specific package have been installed.
#
# Note: This file may be removed if you don't need to use it
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update
sudo -E apt-get install ffmpeg libsm6 libxext6 python3.10 python3.10-venv python3.10-dev -y
sudo mkdir -p /project/data/nim-cache /project/data/nim-stow
sudo chmod -R 777 /project/data/nim-cache /project/data/nim-stow

# Ensure we have write access to /project directory
if [ ! -w "/project" ]; then
    echo "Directory /project is not writable, fixing ownership..."
    sudo chown -R $(id -u):$(id -g) /project
fi

# Determine the project root (assuming this script is in <project_root>/build/postBuild.bash)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "${SCRIPT_DIR}")"

# Create a virtual environment with Python 3.10, using system site packages for apt-installed Python packages
if [ -d "/project/venv" ]; then
    rm -rf /project/venv
fi
python3.10 -m venv --system-site-packages /project/venv
# Install requirements into the virtual environment
/project/venv/bin/pip install -r "${PROJECT_DIR}/requirements.txt"
