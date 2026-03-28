# Run Summary and Error Report

**Generated at:** 2026-03-27T20:01:16.852367
**Working directory:** /home/surfer11may/nvidia-workbench/Surfer11May-DwemerA4Skyrim3_AI_Spark

## Application Logs

### code/output.log

```
http://localhost:8000
Running on local URL:  http://0.0.0.0:8080

To create a public link, set `share=True` in `launch()`.
IMPORTANT: You are using gradio version 4.15.0, however version 4.44.1 is available, please upgrade.
--------

```

### code/chatui/utils/logger.py

```
# SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Logger class for capturing stdout 
import sys

class Logger:
    def __init__(self, filename):
        self.terminal = sys.stdout
        self.log = open(filename, "w")

    def write(self, message):
        self.terminal.write(message)
        self.log.write(message)
        
    def flush(self):
        self.terminal.flush()
        self.log.flush()
        
    def isatty(self):
        return False    

def read_logs():
    sys.stdout.flush()
    with open("/project/code/output.log", "r") as f:
        return f.read()
```

## Tensorboard Data

### data/tensorboard/logs/

- Tensorboard logs directory not found

### /data/tensorboard/logs/

- Tensorboard logs directory not found

### ./data/tensorboard/logs/

- Tensorboard logs directory not found

## Network/Jumbo Frame Statistics

### ip_link_show

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    RX:  bytes packets errors dropped  missed   mcast           
     375328408  430504      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     375328408  430504      0       0       0       0 
2: enP7s7: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8a brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      23651493  269655      0       0       0   15179 
    TX:  bytes packets errors dropped carrier collsns           
     336217230  251440      0       0       0       0 
    altname enP7p1s0
3: enp1s0f0np0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8b brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
             0       0      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
             0       0      0       0       0       0 
4: enp1s0f1np1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8c brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
             0       0      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
             0       0      0       0       0       0 
5: enP2p1s0f0np0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8f brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
             0       0      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
             0       0      0       0       0       0 
6: enP2p1s0f1np1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:90 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
             0       0      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
             0       0      0       0       0       0 
7: wlP9s9: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
    link/ether 50:bb:b5:4d:b2:3e brd ff:ff:ff:ff:ff:ff
    RX:   bytes  packets errors dropped  missed   mcast           
    45478485256 30784623      0   10703       0       0 
    TX:   bytes  packets errors dropped carrier collsns           
      738580981  8759183      0       0       0       0 
    altname wlP9p1s0
11: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether 06:fb:52:a0:05:00 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
       7772380  132382      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
    3552144283  210930      0     113       0       0 
47: br-32d29ded7ce4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether ba:9a:78:e1:09:ed brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      92622294  123408      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     191431986  136225      0       2       0       0 
48: veth5b4ba42@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-32d29ded7ce4 state UP mode DEFAULT group default 
    link/ether c2:05:5b:70:cb:18 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    RX:  bytes packets errors dropped  missed   mcast           
      94350006  123408      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     191441259  136313      0       0       0       0 
118: br-45beb3a4c58f: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether 9a:8a:40:98:38:62 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
        644082     725      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
        319520     868      0       2       0       0 
119: veth8098feb@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-45beb3a4c58f state UP mode DEFAULT group default 
    link/ether 6e:68:17:31:67:a3 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    RX:  bytes packets errors dropped  missed   mcast           
        977263    1377      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
        977072    1603      0       0       0       0 
164: veth17e63b8@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-45beb3a4c58f state UP mode DEFAULT group default 
    link/ether fe:6a:b9:3c:c2:7f brd ff:ff:ff:ff:ff:ff link-netnsid 2
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4140      30      0       0       0       0
```

### jumbo_frame_candidates

```
lo: 65536
enP7s7: 9000
enp1s0f0np0: 1500
enp1s0f1np1: 1500
enP2p1s0f0np0: 1500
enP2p1s0f1np1: 1500
wlP9s9: 1500
docker0: 1500
br-32d29ded7ce4: 1500
veth5b4ba42@if2: 1500
br-45beb3a4c58f: 1500
veth8098feb@if2: 1500
veth17e63b8@if2: 1500
```

### netstat_i

```
Kernel Interface table
Iface             MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
br-32d29ded7ce4  1500        0      0      0 0             0      0      0      0 BMRU
br-45beb3a4c58f  1500        0      0      0 0             0      0      0      0 BMRU
docker0          1500   132382      0      0 0        210930      0    113      0 BMU
enP2p1s0f0np0    1500        0      0      0 0             0      0      0      0 BMU
enP2p1s0f1np1    1500        0      0      0 0             0      0      0      0 BMU
enP7s7           9000   269655      0      0 0        251441      0      0      0 BMRU
enp1s0f0np0      1500        0      0      0 0             0      0      0      0 BMU
enp1s0f1np1      1500        0      0      0 0             0      0      0      0 BMU
lo              65536   430504      0      0 0        430504      0      0      0 LRU
veth17e63b8      1500        3      0      0 0            30      0      0      0 BMRU
veth5b4ba42      1500   123408      0      0 0        136313      0      0      0 BMRU
veth8098feb      1500     1377      0      0 0          1603      0      0      0 BMRU
wlP9s9           1500 30784623      0  10703 0       8759183      0      0      0 BMRU
```

### docker_networks

```
NETWORK ID     NAME                         DRIVER    SCOPE
53cb99162106   bridge                       bridge    local
323c3d436262   host                         host      local
71e533803442   none                         null      local
32d29ded7ce4   openshell-cluster-nemoclaw   bridge    local
45beb3a4c58f   workbench                    bridge    local
```

## System Information and Resource Usage

### nvidia_smi

```
Fri Mar 27 20:01:16 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.126.09             Driver Version: 580.126.09     CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GB10                    On  |   0000000F:01:00.0 Off |                  N/A |
| N/A   41C    P8              4W /  N/A  | Not Supported          |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A            2804      G   /usr/lib/xorg/Xorg                      179MiB |
|    0   N/A  N/A            3060      G   /usr/bin/gnome-shell                     48MiB |
+-----------------------------------------------------------------------------------------+
```

### memory_usage

```
total        used        free      shared  buff/cache   available
Mem:           119Gi       9.2Gi       110Gi        39Mi       2.0Gi       110Gi
Swap:           15Gi       928Mi        15Gi
```

### disk_usage

```
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            12G  9.0M   12G   1% /run
efivarfs        256K   36K  221K  15% /sys/firmware/efi/efivars
/dev/nvme0n1p2  916G  313G  556G  37% /
tmpfs            60G     0   60G   0% /dev/shm
tmpfs           5.0M  8.0K  5.0M   1% /run/lock
/dev/nvme0n1p1  511M   11M  501M   3% /boot/efi
tmpfs            12G  140K   12G   1% /run/user/1000
```

### top_processes

```
top - 20:01:17 up 1 day,  5:56,  6 users,  load average: 0.31, 0.60, 0.66
Tasks: 601 total,   1 running, 600 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.5 sy,  0.0 ni, 99.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem : 122502.8 total, 112748.5 free,   9427.6 used,   2081.0 buff/cache     
MiB Swap:  16384.0 total,  15455.3 free,    928.7 used. 113075.2 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 205985 root      20   0 1847152 535860 130680 S  10.0   0.4  90:39.54 exe
3770418 surfer1+  20   0   26520   5416   3272 R  10.0   0.0   0:00.01 top
      1 root      20   0   23656  11912   7156 S   0.0   0.0   0:06.75 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.37 kthreadd
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_wo+
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     13 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     14 root      20   0       0      0      0 S   0.0   0.0   0:01.62 ksoftir+
```

### docker_containers

```
NAMES                        IMAGE                                     STATUS                  PORTS
project-agentic-rag          project-agentic-rag                       Up 4 minutes            
workbench-proxy              traefik:v3.6.1                            Up 4 hours              80/tcp, 127.0.0.1:10000->10000/tcp
openshell-cluster-nemoclaw   ghcr.io/nvidia/openshell/cluster:0.0.16   Up 25 hours (healthy)   0.0.0.0:8080->30051/tcp
```

## Environment and Configuration

### NGC_API_KEY

```
Not set
```

### HF_TOKEN

```
Not set
```

### TENSORBOARD_LOGS_DIRECTORY

```
Not set
```

### INTERNAL_API

```
Not set
```

### NIM_CACHE_PATH

```
Not set
```

### NIM_STOW_PATH

```
Not set
```

### compose_yaml

```
services:
  init-chmod:
    profiles: [Skyrim-Full-Stack]
    image: busybox
    command: chmod -R 777 /opt/nim/.cache /var/lib/milvus /data
    volumes: [nim-cache:/opt/nim/.cache, milvus-data:/var/lib/milvus, redis-data:/data]
    
  # --- LLM CORE STACK (The Brain) ---
  llm-standard:
    profiles: [Skyrim-Full-Stack]
    image: nvcr.io/nim/nvidia/nemotron-3-nano:1.7.0-nvfp4-variant
    ports: ["8000:8000"]
    environment:
      - NGC_API_KEY=${NGC_API_KEY}
      - NIM_GPU_MEM_FRACTION=0.45
      - NIM_MAX_MODEL_LEN=4096 
    volumes: ["nim-cache:/opt/nim/.cache"]
    deploy:
      resources:
        reservations:
          devices: [{driver: nvidia, device_ids: ['0'], capabilities: [gpu]}]
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/v1/models"]
      interval: 30s
      timeout: 10s
      retries: 10
      start_period: 800s
      
  # llm-fast:
  #   profiles: [Skyrim-Full-Stack]
  #   image: nvcr.io/nim/nvidia/nvidia-nemotron-nano-9b-v2-dgx-spark:1.
... [truncated]
```

---
*This report was generated by summarize_run.py for Git synchronization with NemoClaw AI sandbox.*
