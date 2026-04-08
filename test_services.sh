#!/bin/bash
# Test script for all services in the Skyrim-Full-Stack
echo "Testing Skyrim-Full-Stack services..."
echo "===================================="

# Test llm-standard (port 8000)
echo -e "\nTesting llm-standard (port 8000):"
curl -s -X POST http://localhost:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/NVIDIA-Nemotron-3-Nano-30B-A3B-NVFP4", "prompt": "Skyrim is", "max_tokens": 20}' | jq '.choices[0].text'

# Test llm-fast (port 8001)
echo -e "\nTesting llm-fast (port 8001):"
curl -s -X POST http://localhost:8001/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/nemotron-nano-9b-v2", "prompt": "The Dragonborn", "max_tokens": 20}' | jq '.choices[0].text'

# Test llm-vision (port 8002) - just check if it's responding
echo -e "\nTesting llm-vision (port 8002) health endpoint:"
curl -s http://localhost:8002/v1/models | jq '.data[0].id'

# Test llm-diary (port 8003) - just check if it's responding
echo -e "\nTesting llm-diary (port 8003) health endpoint:"
curl -s http://localhost:8003/v1/models | jq '.data[0].id'

# Test stt-whisper (port 10300) - check if port is open
echo -e "\nTesting stt-whisper (port 10300) connectivity:"
if nc -z localhost 10300; then
  echo "Port 10300 is open"
else
  echo "Port 10300 is not accessible"
fi

# Test tts-xtts (port 8020) - check if port is open
echo -e "\nTesting tts-xtts (port 8020) connectivity:"
if nc -z localhost 8020; then
  echo "Port 8020 is open"
else
  echo "Port 8020 is not accessible"
fi

# Test minime-t5 (port 8003) - check if port is open
echo -e "\nTesting minime-t5 (port 8003) connectivity:"
if nc -z localhost 8003; then
  echo "Port 8003 is open"
else
  echo "Port 8003 is not accessible"
fi

echo -e "\nTesting complete."
