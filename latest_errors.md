errors right after safetensors complete but the desired 4bit model downloads.
The keys not available seems to be a problem of detecting in the wrong place or maybe time but the keys
are obvously working for all models. Might be good to know why the report is not correct but not as important now. 
One of the errors suggested it might be from quantization 
llm-standard-1       | (EngineCore_DP0 pid=190) handling. Evaluate and edit fixes for next test. let me know when ready
to run next test.
Loading safetensors checkpoint shards: 100% Completed | 5/5 [01:39<00:00, 20.24s/it]
llm-standard-1       | (EngineCore_DP0 pid=190) 
Loading safetensors checkpoint shards: 100% Completed | 5/5 [01:39<00:00, 19.83s/it]
llm-standard-1       | (EngineCore_DP0 pid=190) 
llm-standard-1       | (EngineCore_DP0 pid=190) INFO 03-29 17:29:31 [default_loader.py:291] Loading weights took 99.27 seconds
llm-standard-1       | (EngineCore_DP0 pid=190) Process EngineCore_DP0:
llm-standard-1       | (EngineCore_DP0 pid=190) ERROR 03-29 17:29:31 [core.py:946] EngineCore failed to start.

# Run Summary and Error Report

**Generated at:** 2026-03-29T12:29:38.900142
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
     947102672 1159534      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     947102672 1159534      0       0       0       0 
2: enP7s7: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9000 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 30:c5:99:3e:a0:8a brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      54038386  693822      0       0       0   32162 
    TX:  bytes packets errors dropped carrier collsns           
     888279382  665937      0       0       0       0 
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
    99664145242 67463379      0   25174       0       0 
    TX:   bytes  packets errors dropped carrier collsns           
     1656516092 18106316      0       0       0       0 
    altname wlP9p1s0
11: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether 06:fb:52:a0:05:00 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
      16237045  283398      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
    6981055948  435279      0     198       0       0 
47: br-32d29ded7ce4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether ba:9a:78:e1:09:ed brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
     341594382  389793      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     245499193  429194      0       2       0       0 
48: veth5b4ba42@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-32d29ded7ce4 state UP mode DEFAULT group default 
    link/ether c2:05:5b:70:cb:18 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    RX:  bytes packets errors dropped  missed   mcast           
     347051484  389793      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
     245515476  429361      0       0       0       0 
301: br-d3af49231cd8: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default 
    link/ether c2:a4:a4:c7:c8:59 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
             0       0      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
             0       0      0      25       0       0 
422: br-0d97570954ac: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether 4a:2d:0a:21:7d:bc brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
           448      16      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          7392      50      0       1       0       0 
423: veth49420f8@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-0d97570954ac state UP mode DEFAULT group default 
    link/ether 32:c6:46:80:15:1a brd ff:ff:ff:ff:ff:ff link-netnsid 1
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         12007      93      0       0       0       0 
424: veth7ccb6a5@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-0d97570954ac state UP mode DEFAULT group default 
    link/ether 46:12:b4:70:1a:30 brd ff:ff:ff:ff:ff:ff link-netnsid 2
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4807      43      0       0       0       0 
425: br-8b0f51095d45: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default 
    link/ether 02:4d:22:9f:11:73 brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast           
         21740      95      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         88146     116      0       7       0       0 
434: vethbd74a1e@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-0d97570954ac state UP mode DEFAULT group default 
    link/ether 06:5a:58:dc:c5:85 brd ff:ff:ff:ff:ff:ff link-netnsid 3
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4490      37      0       0       0       0 
435: vethf735c41@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-8b0f51095d45 state UP mode DEFAULT group default 
    link/ether 2a:db:31:c5:18:ea brd ff:ff:ff:ff:ff:ff link-netnsid 5
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
         10021      73      0       0       0       0 
436: veth2cd8ddf@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-8b0f51095d45 state UP mode DEFAULT group default 
    link/ether 2e:cf:16:c5:16:5e brd ff:ff:ff:ff:ff:ff link-netnsid 3
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          9979      72      0       0       0       0 
437: vethe9fdbfb@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-0d97570954ac state UP mode DEFAULT group default 
    link/ether aa:99:4f:91:4b:ec brd ff:ff:ff:ff:ff:ff link-netnsid 5
    RX:  bytes packets errors dropped  missed   mcast           
           126       3      0       0       0       0 
    TX:  bytes packets errors dropped carrier collsns           
          4448      36      0       0       0       0
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
br-0d97570954ac: 1500
veth49420f8@if2: 1500
veth7ccb6a5@if2: 1500
br-8b0f51095d45: 1500
vethbd74a1e@if2: 1500
vethf735c41@if2: 1500
veth2cd8ddf@if3: 1500
vethe9fdbfb@if3: 1500
```

### netstat_i

```
Kernel Interface table
Iface             MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
br-0d97570954ac  1500        0      0      0 0             0      0      0      0 BMRU
br-32d29ded7ce4  1500        0      0      0 0             0      0      0      0 BMRU
br-8b0f51095d45  1500        0      0      0 0             0      0      0      0 BMRU
br-d3af49231cd8  1500        0      0      0 0             0      0      0      0 BMU
docker0          1500   283398      0      0 0        435279      0    198      0 BMU
enP2p1s0f0np0    1500        0      0      0 0             0      0      0      0 BMU
enP2p1s0f1np1    1500        0      0      0 0             0      0      0      0 BMU
enP7s7           9000   693822      0      0 0        665937      0      0      0 BMRU
enp1s0f0np0      1500        0      0      0 0             0      0      0      0 BMU
enp1s0f1np1      1500        0      0      0 0             0      0      0      0 BMU
lo              65536  1159534      0      0 0       1159534      0      0      0 LRU
veth2cd8ddf      1500        3      0      0 0            72      0      0      0 BMRU
veth49420f8      1500        3      0      0 0            93      0      0      0 BMRU
veth5b4ba42      1500   389793      0      0 0        429361      0      0      0 BMRU
veth7ccb6a5      1500        3      0      0 0            43      0      0      0 BMRU
vethbd74a1e      1500        3      0      0 0            37      0      0      0 BMRU
vethe9fdbfb      1500        3      0      0 0            36      0      0      0 BMRU
vethf735c41      1500        3      0      0 0            73      0      0      0 BMRU
wlP9s9           1500 67463379      0  25174 0      18106316      0      0      0 BMRU
```

### docker_networks

```
NETWORK ID     NAME                                           DRIVER    SCOPE
8b0f51095d45   agentic-rag_default                            bridge    local
53cb99162106   bridge                                         bridge    local
323c3d436262   host                                           host      local
71e533803442   none                                           null      local
32d29ded7ce4   openshell-cluster-nemoclaw                     bridge    local
d3af49231cd8   surfer11may-dwemera4skyrim3_ai_spark_default   bridge    local
0d97570954ac   workbench                                      bridge    local
```

## System Information and Resource Usage

### nvidia_smi

```
Sun Mar 29 12:29:38 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.126.09             Driver Version: 580.126.09     CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GB10                    On  |   0000000F:01:00.0 Off |                  N/A |
| N/A   45C    P8              4W /  N/A  | Not Supported          |      0%      Default |
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
Mem:           119Gi       9.7Gi        74Gi        40Mi        37Gi       109Gi
Swap:           15Gi       820Mi        15Gi
```

### disk_usage

```
Filesystem      Size  Used Avail Use% Mounted on
tmpfs            12G  9.6M   12G   1% /run
efivarfs        256K   36K  221K  15% /sys/firmware/efi/efivars
/dev/nvme0n1p2  916G  376G  493G  44% /
tmpfs            60G     0   60G   0% /dev/shm
tmpfs           5.0M  8.0K  5.0M   1% /run/lock
/dev/nvme0n1p1  511M   11M  501M   3% /boot/efi
tmpfs            12G  144K   12G   1% /run/user/1000
```

### top_processes

```
top - 12:29:39 up 2 days, 22:25,  9 users,  load average: 1.25, 0.83, 0.68
Tasks: 621 total,   1 running, 620 sleeping,   0 stopped,   0 zombie
%Cpu(s):  1.9 us,  2.3 sy,  0.0 ni, 95.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem : 122502.8 total,  75810.3 free,   9964.7 used,  38732.3 buff/cache     
MiB Swap:  16384.0 total,  15563.8 free,    820.2 used. 112538.1 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 206400 root      20   0 1495112 155196 108252 S   9.1   0.1  16:07.38 contain+
1168256 surfer1+  20   0 1256268  40724  21164 S   9.1   0.0   0:07.12 wb-svc
1194782 surfer1+  20   0   26520   5400   3244 R   9.1   0.0   0:00.01 top
      1 root      20   0   23912  12076   7176 S   0.0   0.0   0:14.89 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.85 kthreadd
      3 root      20   0       0      0      0 S   0.0   0.0   0:00.00 pool_wo+
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      7 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
     13 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker+
```

### docker_containers

```
NAMES                        IMAGE                                     STATUS                PORTS
agentic-rag-milvus-1         milvusdb/milvus:v2.4.6                    Up 2 minutes          0.0.0.0:19530->19530/tcp, [::]:19530->19530/tcp
agentic-rag-redis-1          redis:7                                   Up 2 minutes          0.0.0.0:6379->6379/tcp, [::]:6379->6379/tcp
project-agentic-rag          project-agentic-rag                       Up 2 minutes          
workbench-proxy              traefik:v3.6.1                            Up 3 minutes          80/tcp, 127.0.0.1:10000->10000/tcp
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
