# Run Summary and Error Report

**Generated at:** 2026-03-29T11:02:47.410422
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
     823520109 1119607      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     823520109 1119607      0       0       0       0 
2: enP7s7: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8a brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      51856679  672302      0       0       0   31243 
    TX:  bytes packets errors dropped carrier collsns           
     765341454  641122      0       0       0       0 
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
    99650866263 67436565      0   24654       0       0 
    TX:   bytes  packets errors dropped carrier collsns           
     1653508387 18094646      0       0       0       0 
    altname wlP9p1s0
11: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether 06:fb:52:a0:05:00 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      16237045  283398      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
    6981055948  435279      0     195       0       0 
47: br-32d29ded7ce4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether ba:9a:78:e1:09:ed brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
     341594382  389793      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     245498999  429192      0       2       0       0 
48: veth5b4ba42@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-32d29ded7ce4 state UP mode DEFAULT group default 
    link/ether c2:05:5b:70:cb:18 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    RX:  bytes packets errors dropped  missed   mcast           
     347051484  389793      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     245515105  429357      0       0       0       0 
301: br-d3af49231cd8: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether c2:a4:a4:c7:c8:59 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
             0       0      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
             0       0      0      24       0       0 
333: br-4202f689d4d0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether 7e:e6:58:3a:3c:c8 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
           448      16      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          7825      53      0       1       0       0 
334: veth49b5d3a@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-4202f689d4d0 state UP mode DEFAULT group default 
    link/ether 62:1e:3d:14:35:23 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         12865     100      0       0       0       0 
335: veth2359036@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-4202f689d4d0 state UP mode DEFAULT group default 
    link/ether d2:49:7b:27:46:6a brd ff:ff:ff:ff:ff:ff link-netnsid 2
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          5690      52      0       0       0       0 
336: br-0e290bc8392c: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether 46:16:19:8a:a7:69 brd ff:ff:ff:ff:ff:ff
    RX:   bytes packets errors dropped  missed   mcast           
      317568242 4864712      0       0       0       0 
    TX:   bytes packets errors dropped carrier collsns           
    19450846058 6741724      0      10       0       0 
345: veth2655abe@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-4202f689d4d0 state UP mode DEFAULT group default 
    link/ether ae:ef:72:c8:d6:3d brd ff:ff:ff:ff:ff:ff link-netnsid 3
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4721      39      0       0       0       0 
346: veth823c0f6@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-0e290bc8392c state UP mode DEFAULT group default 
    link/ether 76:a6:56:15:5a:c7 brd ff:ff:ff:ff:ff:ff link-netnsid 5
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         10745      81      0       0       0       0 
347: vethc81e96c@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-0e290bc8392c state UP mode DEFAULT group default 
    link/ether 92:c1:82:bc:7f:0c brd ff:ff:ff:ff:ff:ff link-netnsid 3
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         10633      79      0       0       0       0 
348: veth705d426@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-4202f689d4d0 state UP mode DEFAULT group default 
    link/ether 8a:17:f8:d9:f7:41 brd ff:ff:ff:ff:ff:ff link-netnsid 5
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4679      38      0       0       0       0
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
br-d3af49231cd8: 1500
br-4202f689d4d0: 1500
veth49b5d3a@if2: 1500
veth2359036@if2: 1500
br-0e290bc8392c: 1500
veth2655abe@if2: 1500
veth823c0f6@if2: 1500
vethc81e96c@if3: 1500
veth705d426@if3: 1500
```

### netstat_i

```
Kernel Interface table
Iface             MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
br-0e290bc8392c  1500        0      0      0 0             0      0      0      0 BMRU
br-32d29ded7ce4  1500        0      0      0 0             0      0      0      0 BMRU
br-4202f689d4d0  1500        0      0      0 0             0      0      0      0 BMRU
br-d3af49231cd8  1500        0      0      0 0             0      0      0      0 BMU
docker0          1500   283398      0      0 0        435279      0    195      0 BMU
enP2p1s0f0np0    1500        0      0      0 0             0      0      0      0 BMU
enP2p1s0f1np1    1500        0      0      0 0             0      0      0      0 BMU
enP7s7           9000   672302      0      0 0        641122      0      0      0 BMRU
enp1s0f0np0      1500        0      0      0 0             0      0      0      0 BMU
enp1s0f1np1      1500        0      0      0 0             0      0      0      0 BMU
lo              65536  1119607      0      0 0       1119607      0      0      0 LRU
veth2359036      1500        3      0      0 0            52      0      0      0 BMRU
veth2655abe      1500        3      0      0 0            39      0      0      0 BMRU
veth49b5d3a      1500        3      0      0 0           100      0      0      0 BMRU
veth5b4ba42      1500   389793      0      0 0        429357      0      0      0 BMRU
veth705d426      1500        3      0      0 0            38      0      0      0 BMRU
veth823c0f6      1500        3      0      0 0            81      0      0      0 BMRU
vethc81e96c      1500        3      0      0 0            79      0      0      0 BMRU
wlP9s9           1500 67436565      0  24654 0      18094646      0      0      0 BMRU
```

### docker_networks

```
NETWORK ID     NAME                                           DRIVER    SCOPE
0e290bc8392c   agentic-rag_default                            bridge    local
53cb99162106   bridge                                         bridge    local
323c3d436262   host                                           host      local
71e533803442   none                                           null      local
32d29ded7ce4   openshell-cluster-nemoclaw                     bridge    local
d3af49231cd8   surfer11may-dwemera4skyrim3_ai_spark_default   bridge    local
4202f689d4d0   workbench                                      bridge    local
```

## System Information and Resource Usage

### nvidia_smi

```
Sun Mar 29 11:02:47 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.126.09             Driver Version: 580.126.09     CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GB10                    On  |   0000000F:01:00.0 Off |                  N/A |
| N/A   42C    P8              4W /  N/A  | Not Supported          |      0%      Default |
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
Mem:           119Gi       9.6Gi        74Gi        40Mi        37Gi       110Gi
Swap:           15Gi       820Mi        15Gi
```

### disk_usage

```
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            12G  9.7M   12G   1% /run
efivarfs        256K   36K  221K  15% /sys/firmware/efi/efivars
/dev/nvme0n1p2  916G  376G  493G  44% /
tmpfs            60G     0   60G   0% /dev/shm
tmpfs           5.0M  8.0K  5.0M   1% /run/lock
/dev/nvme0n1p1  511M   11M  501M   3% /boot/efi
tmpfs            12G  144K   12G   1% /run/user/1000
```

### top_processes

```
top - 11:02:47 up 2 days, 20:58,  7 users,  load average: 0.89, 0.98, 0.80
Tasks: 612 total,   1 running, 611 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.5 us,  0.5 sy,  0.0 ni, 99.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem : 122502.8 total,  75954.2 free,   9853.4 used,  38699.8 buff/cache     
MiB Swap:  16384.0 total,  15563.3 free,    820.7 used. 112649.4 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 205985 root      20   0 1852528 545700 132588 S  10.0   0.4 229:10.31 exe
 815402 root      20   0   12.5g 236340 137432 S  10.0   0.2   0:16.13 milvus
      1 root      20   0   23912  12076   7176 S   0.0   0.0   0:13.65 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.83 kthreadd
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_wo+
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     13 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     14 root      20   0       0      0      0 S   0.0   0.0   0:03.69 ksoftir+
```

### docker_containers

```
NAMES                        IMAGE                                     STATUS                PORTS
agentic-rag-milvus-1         milvusdb/milvus:v2.4.6                    Up 8 minutes          0.0.0.0:19530->19530/tcp, [::]:19530->19530/tcp
agentic-rag-redis-1          redis:7                                   Up 8 minutes          0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp
project-agentic-rag          project-agentic-rag                       Up 11 minutes         
workbench-proxy              traefik:v3.6.1                            Up 12 minutes         80/tcp, 127.0.0.1:10000->10000/tcp
openshell-cluster-nemoclaw   ghcr.io/nvidia/openshell/cluster:0.0.16   Up 2 days (healthy)   0.0.0.0:8080->30051/tcp
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
    
  # --- LLM CORE STACK (NVFP4 Variant) ---
  llm-standard:
    profiles: [Skyrim-Full-Stack]
    image: nvcr.io/nvidia/vllm:26.02-py3 
    ports: ["8000:8000"]
    environment:
      - NGC_API_KEY=${NGC_API_KEY}
      - HF_TOKEN=${HF_TOKEN}
      # Required for vLLM to use the NVFP4 specialized kernels on Spark
      - VLLM_USE_FLASHINFER_MOE_FP4=1 
    volumes: 
      - "nim-cache:/root/.cache/huggingface"
    command: >
      vllm serve "nvidia/NVIDIA-Nemotron-3-Nano-30B-A3B-NVFP4"
      --host 0.0.0.0
      --port 8000
      --trust-remote-code
      --max-model-len 4096
      --gpu-memory-utilization 0.90
    deploy:
      resources:
        reservations:
          devices: [{driver: nvidia, device_ids: ['0'], capabilities: [gpu]}]
    healthcheck:
   
... [truncated]
```

---
*This report was generated by summarize_run.py for Git synchronization with NemoClaw AI sandbox.*
