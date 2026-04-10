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

# Test llm-vision (port 8002) - describe an image
echo -e "\nTesting llm-vision (port 8002) image description:"
if [ -f "PhotoTest.JPG" ]; then
  # Get the first available model
  MODEL_ID=$(curl -s http://localhost:8002/v1/models | jq -r '.data[0].id')
  if [ -z "$MODEL_ID" ] || [ "$MODEL_ID" = "null" ]; then
    echo "Failed to get model ID from llm-vision"
  else
    # Encode image to base64
    BASE64_IMAGE=$(base64 -w 0 "PhotoTest.JPG")
    # Create JSON payload and send via stdin to avoid argument list issues
    {
      echo '{'
      echo '  "model": "'"$MODEL_ID"'",'
      echo '  "messages": ['
      echo '    {'
      echo '      "role": "user",'
      echo '      "content": ['
      echo '        {'
      echo '          "type": "text",'
      echo '          "text": "Describe this image in a short sentence."'
      echo '        },'
      echo '        {'
      echo '          "type": "image_url",'
      echo '          "image_url": {'
      echo '            "url": "data:image/jpeg;base64,'"$BASE64_IMAGE"'"'
      echo '          }'
      echo '        }'
      echo '      ]'
      echo '    }'
      echo '  ],'
      echo '  "max_tokens": 100'
      echo '}'
    } | curl -s -X POST http://localhost:8002/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d @- | jq '.choices[0].message.content'
  fi
else
  echo "PhotoTest.JPG file not found, skipping vision test"
fi

# Test llm-diary (port 8003) - just check if it's responding
echo -e "\nTesting llm-diary (port 8003) health endpoint:"
curl -s http://localhost:8003/v1/models | jq '.data[0].id'

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
