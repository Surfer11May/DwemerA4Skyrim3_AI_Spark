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

# Test llm-diary (port 8003) - test with a prompt
echo -e "\nTesting llm-diary (port 8003) with diary prompt:"
curl -s -X POST http://localhost:8003/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/Llama-3.1-8B-Instruct-NVFP4", "prompt": "Today I felt", "max_tokens": 20}' | jq '.choices[0].text'

# Test stt-whisper (port 8004) - check if port is open
echo -e "\nTesting stt-whisper (port 8004) connectivity:"
if nc -z localhost 8004; then
  echo "Port 8004 is open"
else
  echo "Port 8004 is not accessible"
fi

# Test tts-xtts (port 8020) - check if port is open
echo -e "\nTesting tts-xtts (port 8020) connectivity:"
if nc -z localhost 8020; then
  echo "Port 8020 is open"
else
  echo "Port 8020 is not accessible"
fi

# Test minime-t5 (port 8082) - check if port is open
echo -e "\nTesting minime-t5 (port 8082) connectivity:"
if nc -z localhost 8082; then
  echo "Port 8082 is open"
else
  echo "Port 8082 is not accessible"
fi

echo -e "\nTesting complete."
