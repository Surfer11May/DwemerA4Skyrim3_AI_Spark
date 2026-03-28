# Run Summary and Error Report

**Generated at:** 2026-03-28T18:06:27.160988
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
     627699935  917128      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     627699935  917128      0       0       0       0 
2: enP7s7: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8a brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      43992532  568395      0       0       0   25653 
    TX:  bytes packets errors dropped carrier collsns           
     576195811  537817      0       0       0       0 
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
    71757192705 48650571      0   18601       0       0 
    TX:   bytes  packets errors dropped carrier collsns           
     1146963891 12782600      0       0       0       0 
    altname wlP9p1s0
11: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether 06:fb:52:a0:05:00 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      16237045  283398      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
    6981055948  435279      0     161       0       0 
47: br-32d29ded7ce4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether ba:9a:78:e1:09:ed brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
     238497447  315774      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     238196347  342562      0       2       0       0 
48: veth5b4ba42@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-32d29ded7ce4 state UP mode DEFAULT group default 
    link/ether c2:05:5b:70:cb:18 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    RX:  bytes packets errors dropped  missed   mcast           
     242918283  315774      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     238209444  342693      0       0       0       0 
237: br-e02533711b9d: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether 82:56:3f:0f:46:60 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
           980      35      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          8203      58      0       2       0       0 
238: vethac7db83@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-e02533711b9d state UP mode DEFAULT group default 
    link/ether c6:45:f6:5d:56:54 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         14501     130      0       0       0       0 
264: veth3e5f506@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-e02533711b9d state UP mode DEFAULT group default 
    link/ether da:12:4a:cf:14:e8 brd ff:ff:ff:ff:ff:ff link-netnsid 2
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          5197      48      0       0       0       0 
265: br-59255a68eec9: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether aa:b8:e3:82:8d:11 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
          9416      81      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         30480     108      0       8       0       0 
272: veth062b984@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-59255a68eec9 state UP mode DEFAULT group default 
    link/ether 4a:3f:eb:a0:df:b1 brd ff:ff:ff:ff:ff:ff link-netnsid 3
    RX:  bytes packets errors dropped  missed   mcast           
         10214      73      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         35289     150      0       0       0       0 
273: veth4db21b3@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-e02533711b9d state UP mode DEFAULT group default 
    link/ether 32:25:7c:56:8e:82 brd ff:ff:ff:ff:ff:ff link-netnsid 3
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          5029      44      0       0       0       0 
274: veth07beccf@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-59255a68eec9 state UP mode DEFAULT group default 
    link/ether 4a:dc:62:d3:57:c5 brd ff:ff:ff:ff:ff:ff link-netnsid 4
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         12608     103      0       0       0       0 
275: veth27614d2@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-e02533711b9d state UP mode DEFAULT group default 
    link/ether fe:d7:a3:4b:9d:82 brd ff:ff:ff:ff:ff:ff link-netnsid 5
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4987      43      0       0       0       0 
276: veth31092ee@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-e02533711b9d state UP mode DEFAULT group default 
    link/ether 8a:61:d6:ba:1c:9d brd ff:ff:ff:ff:ff:ff link-netnsid 4
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4945      42      0       0       0       0 
277: vethacd656d@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-59255a68eec9 state UP mode DEFAULT group default 
    link/ether d6:8f:cc:e7:5d:2e brd ff:ff:ff:ff:ff:ff link-netnsid 5
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         12655     103      0       0       0       0
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
br-e02533711b9d: 1500
vethac7db83@if2: 1500
veth3e5f506@if2: 1500
br-59255a68eec9: 1500
veth062b984@if2: 1500
veth4db21b3@if3: 1500
veth07beccf@if2: 1500
veth27614d2@if2: 1500
veth31092ee@if3: 1500
vethacd656d@if3: 1500
```

### netstat_i

```
Kernel Interface table
Iface             MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
br-32d29ded7ce4  1500        0      0      0 0             0      0      0      0 BMRU
br-59255a68eec9  1500        0      0      0 0             0      0      0      0 BMRU
br-e02533711b9d  1500        0      0      0 0             0      0      0      0 BMRU
docker0          1500   283398      0      0 0        435279      0    161      0 BMU
enP2p1s0f0np0    1500        0      0      0 0             0      0      0      0 BMU
enP2p1s0f1np1    1500        0      0      0 0             0      0      0      0 BMU
enP7s7           9000   568395      0      0 0        537817      0      0      0 BMRU
enp1s0f0np0      1500        0      0      0 0             0      0      0      0 BMU
enp1s0f1np1      1500        0      0      0 0             0      0      0      0 BMU
lo              65536   917128      0      0 0        917128      0      0      0 LRU
veth062b984      1500       73      0      0 0           150      0      0      0 BMRU
veth07beccf      1500        3      0      0 0           103      0      0      0 BMRU
veth27614d2      1500        3      0      0 0            43      0      0      0 BMRU
veth31092ee      1500        3      0      0 0            42      0      0      0 BMRU
veth3e5f506      1500        3      0      0 0            48      0      0      0 BMRU
veth4db21b3      1500        3      0      0 0            44      0      0      0 BMRU
veth5b4ba42      1500   315774      0      0 0        342693      0      0      0 BMRU
vethac7db83      1500        3      0      0 0           130      0      0      0 BMRU
vethacd656d      1500        3      0      0 0           103      0      0      0 BMRU
wlP9s9           1500 48650571      0  18601 0      12782600      0      0      0 BMRU
```

### docker_networks

```
NETWORK ID     NAME                         DRIVER    SCOPE
59255a68eec9   agentic-rag_default          bridge    local
53cb99162106   bridge                       bridge    local
323c3d436262   host                         host      local
71e533803442   none                         null      local
32d29ded7ce4   openshell-cluster-nemoclaw   bridge    local
e02533711b9d   workbench                    bridge    local
```

## System Information and Resource Usage

### nvidia_smi

```
Sat Mar 28 18:06:27 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.126.09             Driver Version: 580.126.09     CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GB10                    On  |   0000000F:01:00.0 Off |                  N/A |
| N/A   44C    P0             11W /  N/A  | Not Supported          |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A            2804      G   /usr/lib/xorg/Xorg                      179MiB |
|    0   N/A  N/A            3060      G   /usr/bin/gnome-shell                     48MiB |
|    0   N/A  N/A         2693630      C   VLLM::EngineCore                      10794... |
+-----------------------------------------------------------------------------------------+
```

### memory_usage

```
total        used        free      shared  buff/cache   available
Mem:           119Gi       117Gi       1.2Gi       152Mi       2.7Gi       2.0Gi
Swap:           15Gi       1.9Gi        14Gi
```

### disk_usage

```
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            12G  9.4M   12G   1% /run
efivarfs        256K   36K  221K  15% /sys/firmware/efi/efivars
/dev/nvme0n1p2  916G  344G  526G  40% /
tmpfs            60G     0   60G   0% /dev/shm
tmpfs           5.0M  8.0K  5.0M   1% /run/lock
/dev/nvme0n1p1  511M   11M  501M   3% /boot/efi
tmpfs            12G  140K   12G   1% /run/user/1000
```

### top_processes

```
top - 18:06:27 up 2 days,  4:01,  6 users,  load average: 0.23, 0.29, 0.34
Tasks: 610 total,   1 running, 609 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.5 us,  0.5 sy,  0.0 ni, 99.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem : 122502.8 total,   1219.6 free, 120467.2 used,   2800.7 buff/cache     
MiB Swap:  16384.0 total,  14411.0 free,   1973.0 used.   2035.6 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
2689232 root      20   0   12.4g 126364  45220 S  27.3   0.1   1:12.29 milvus
   2079 root      20   0 3124432  31484   9804 S   9.1   0.0   5:29.27 contain+
2693630 surfer1+  20   0  159.0g   2.3g 336280 S   9.1   2.0   4:51.64 VLLM::E+
2852928 surfer1+  20   0   26520   5376   3236 R   9.1   0.0   0:00.01 top
      1 root      20   0   23656  11932   7156 S   0.0   0.0   0:09.81 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.63 kthreadd
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_wo+
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
```

### docker_containers

```
NAMES                        IMAGE                                              STATUS                    PORTS
agentic-rag-milvus-1         milvusdb/milvus:v2.4.6                             Up 48 minutes             0.0.0.0:19530->19530/tcp, [::]:19530->19530/tcp
agentic-rag-redis-1          redis:7                                            Up 48 minutes             0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp
agentic-rag-llm-standard-1   nvcr.io/nim/nvidia/nemotron-3-nano:1.7.0-variant   Up 48 minutes (healthy)   0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp
project-agentic-rag          project-agentic-rag                                Up 49 minutes             
workbench-proxy              traefik:v3.6.1                                     Up 2 hours                80/tcp, 127.0.0.1:10000->10000/tcp
openshell-cluster-nemoclaw   ghcr.io/nvidia/openshell/cluster:0.0.16            Up 2 days (healthy)       0.0.0.0:8080->30051/tcp
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
    image: nvcr.io/nim/nvidia/nemotron-3-nano:1.7.0-variant
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
      
  milvus:
    profiles: [Skyrim-Full-Stack]
    image: "milvusdb/milvus:v2.4.6"
    depends_on:
      init-chmod: {condition: s
... [truncated]
```

---
*This report was generated by summarize_run.py for Git synchronization with NemoClaw AI sandbox.*
