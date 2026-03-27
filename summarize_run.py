#!/usr/bin/env python3
"""
summarize_run.py - Script to gather logs and errors from NVIDIA AI Workbench runs
for Git synchronization with the NemoClaw AI sandbox.

This script collects:
1. Application logs (output.log, chatui logs)
2. Tensorboard event files
3. Network/Jumbo Frame statistics (if available)
4. Docker container status
5. System resource usage during the run

Outputs to: latest_errors.md
"""

import os
import sys
import subprocess
import json
from datetime import datetime
from pathlib import Path

def run_command(cmd, capture_output=True):
    """Run a shell command and return output."""
    try:
        result = subprocess.run(
            cmd, shell=True, capture_output=capture_output, text=True, timeout=30
        )
        return result.stdout.strip(), result.stderr.strip(), result.returncode
    except subprocess.TimeoutExpired:
        return "", "Timeout expired", 1
    except Exception as e:
        return "", str(e), 1

def collect_logs():
    """Collect application logs."""
    logs = {}
    
    # Main output log
    log_files = [
        "code/output.log",
        "code/chatui/utils/logger.py"
    ]
    
    for log_file in log_files:
        if os.path.exists(log_file):
            try:
                with open(log_file, 'r') as f:
                    logs[log_file] = f.read()
            except Exception as e:
                logs[log_file] = f"Error reading file: {e}"
        else:
            logs[log_file] = "File not found"
    
    return logs

def collect_tensorboard_data():
    """Collect Tensorboard event files information."""
    tensorboard_info = {}
    
    # Look for tensorboard logs
    tb_paths = [
        "data/tensorboard/logs/",
        "/data/tensorboard/logs/",
        "./data/tensorboard/logs/"
    ]
    
    for tb_path in tb_paths:
        if os.path.exists(tb_path):
            tensorboard_info[tb_path] = {
                "exists": True,
                "files": [],
                "total_size": 0
            }
            
            try:
                for root, dirs, files in os.walk(tb_path):
                    for file in files:
                        filepath = os.path.join(root, file)
                        rel_path = os.path.relpath(filepath, tb_path)
                        size = os.path.getsize(filepath)
                        tensorboard_info[tb_path]["files"].append({
                            "name": rel_path,
                            "size": size,
                            "modified": datetime.fromtimestamp(os.path.getmtime(filepath)).isoformat()
                        })
                        tensorboard_info[tb_path]["total_size"] += size
            except Exception as e:
                tensorboard_info[tb_path]["error"] = str(e)
        else:
            tensorboard_info[tb_path] = {"exists": False}
    
    return tensorboard_info

def collect_network_stats():
    """Collect network/Jumbo Frame statistics."""
    network_info = {}
    
    # Try to get network interface information
    stdout, stderr, rc = run_command("ip -s link show")
    if rc == 0:
        network_info["ip_link_show"] = stdout
    
    # Try to get Jumbo Frame status (MTU > 1500)
    stdout, stderr, rc = run_command("ip link show | grep -E 'mtu [0-9]+' | awk '{print $2, $5}'")
    if rc == 0:
        network_info["jumbo_frame_candidates"] = stdout
    
    # Try to get network statistics
    stdout, stderr, rc = run_command("netstat -i")
    if rc == 0:
        network_info["netstat_i"] = stdout
        
    # Try to get Docker network info if applicable
    stdout, stderr, rc = run_command("docker network ls")
    if rc == 0:
        network_info["docker_networks"] = stdout
    
    return network_info

def collect_system_info():
    """Collect system information and resource usage."""
    sys_info = {}
    
    # GPU info
    stdout, stderr, rc = run_command("nvidia-smi")
    if rc == 0:
        sys_info["nvidia_smi"] = stdout
    
    # Memory usage
    stdout, stderr, rc = run_command("free -h")
    if rc == 0:
        sys_info["memory_usage"] = stdout
    
    # Disk usage
    stdout, stderr, rc = run_command("df -h")
    if rc == 0:
        sys_info["disk_usage"] = stdout
    
    # Running processes (top)
    stdout, stderr, rc = run_command("top -b -n 1 | head -20")
    if rc == 0:
        sys_info["top_processes"] = stdout
    
    # Docker containers
    stdout, stderr, rc = run_command("docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'")
    if rc == 0:
        sys_info["docker_containers"] = stdout
    
    return sys_info

def collect_environment():
    """Collect environment variables and configuration."""
    env_info = {}
    
    # Key environment variables
    key_vars = ['NGC_API_KEY', 'HF_TOKEN', 'TENSORBOARD_LOGS_DIRECTORY', 
                'INTERNAL_API', 'NIM_CACHE_PATH', 'NIM_STOW_PATH']
    
    for var in key_vars:
        env_info[var] = os.environ.get(var, "Not set")
    
    # Compose file info
    if os.path.exists("compose.yaml"):
        try:
            with open("compose.yaml", 'r') as f:
                env_info["compose_yaml"] = f.read()
        except Exception as e:
            env_info["compose_yaml_error"] = str(e)
    
    return env_info

def main():
    """Main function to gather all information and create latest_errors.md."""
    print("Gathering run information for Git synchronization...")
    
    # Create output directory if it doesn't exist
    output_file = "latest_errors.md"
    
    with open(output_file, 'w') as f:
        f.write("# Run Summary and Error Report\n\n")
        f.write(f"**Generated at:** {datetime.now().isoformat()}\n")
        f.write(f"**Working directory:** {os.getcwd()}\n\n")
        
        # Application Logs
        f.write("## Application Logs\n\n")
        logs = collect_logs()
        for log_file, content in logs.items():
            f.write(f"### {log_file}\n\n")
            f.write("```\n")
            f.write(content[:5000])  # Limit to 5000 chars per log
            if len(content) > 5000:
                f.write("\n... [truncated]")
            f.write("\n```\n\n")
        
        # Tensorboard Data
        f.write("## Tensorboard Data\n\n")
        tb_data = collect_tensorboard_data()
        for path, info in tb_data.items():
            f.write(f"### {path}\n\n")
            if info.get("exists", False):
                f.write(f"- **Total files:** {len(info.get('files', []))}\n")
                f.write(f"- **Total size:** {info.get('total_size', 0)} bytes\n")
                if info.get('files'):
                    f.write("- **Recent files:**\n")
                    for file_info in sorted(info['files'], 
                                          key=lambda x: x['modified'], 
                                          reverse=True)[:5]:
                        f.write(f"  - {file_info['name']} ({file_info['size']} bytes, {file_info['modified']})\n")
            else:
                f.write("- Tensorboard logs directory not found\n")
            f.write("\n")
        
        # Network Statistics
        f.write("## Network/Jumbo Frame Statistics\n\n")
        net_info = collect_network_stats()
        for key, value in net_info.items():
            if value:  # Only write non-empty values
                f.write(f"### {key}\n\n")
                f.write("```\n")
                f.write(value)
                f.write("\n```\n\n")
        
        # System Information
        f.write("## System Information and Resource Usage\n\n")
        sys_info = collect_system_info()
        for key, value in sys_info.items():
            if value:  # Only write non-empty values
                f.write(f"### {key}\n\n")
                f.write("```\n")
                f.write(value)
                f.write("\n```\n\n")
        
        # Environment and Configuration
        f.write("## Environment and Configuration\n\n")
        env_info = collect_environment()
        for key, value in env_info.items():
            if isinstance(value, str) and len(value) > 1000:
                f.write(f"### {key}\n\n")
                f.write("```\n")
                f.write(value[:1000] + "\n... [truncated]")
                f.write("\n```\n\n")
            elif value:  # Only write non-empty values
                f.write(f"### {key}\n\n")
                f.write(f"```\n{value}\n```\n\n")
        
        f.write("---\n")
        f.write("*This report was generated by summarize_run.py for Git synchronization with NemoClaw AI sandbox.*\n")
    
    print(f"Run summary written to {output_file}")
    print(f"File size: {os.path.getsize(output_file)} bytes")

if __name__ == "__main__":
    main()