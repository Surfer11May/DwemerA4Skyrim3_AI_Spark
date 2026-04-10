#!/bin/bash
# Test script for all services in the Skyrim-Full-Stack
echo "Testing Skyrim-Full-Stack services..."
echo "===================================="

# Test llm-standard (port 8000)
echo -e "\nTesting llm-standard (port 8000):"
start_time=$(date +%s.%N)
response=$(curl -s -X POST http://localhost:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/NVIDIA-Nemotron-3-Nano-30B-A3B-NVFP4", "prompt": "Skyrim is", "max_tokens": 20}')
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)
echo "$response" | jq '.choices[0].text'
echo "Response time: $(printf "%.2f" $elapsed)s"

# Test llm-fast (port 8001)
echo -e "\nTesting llm-fast (port 8001):"
start_time=$(date +%s.%N)
response=$(curl -s -X POST http://localhost:8001/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/nemotron-nano-9b-v2", "prompt": "The Dragonborn", "max_tokens": 20}')
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)
echo "$response" | jq '.choices[0].text'
echo "Response time: $(printf "%.2f" $elapsed)s"

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
    # Create JSON payload
    read -r -d '' JSON_PAYLOAD <<EOF
{
  "model": "$MODEL_ID",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "Describe this image in a short sentence."
        },
        {
          "type": "image_url",
          "image_url": {
            "url": "data:image/jpeg;base64,$BASE64_IMAGE"
          }
        }
      ]
    }
  ],
  "max_tokens": 100
}
EOF
    # Send request to vision endpoint and measure time
    start_time=$(date +%s.%N)
    response=$(curl -s -X POST http://localhost:8002/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d "$JSON_PAYLOAD")
    end_time=$(date +%s.%N)
    elapsed=$(echo "$end_time - $start_time" | bc)
    
    # Handle both chat and completion response formats
    content=$(echo "$response" | jq -r '.choices[0].message.content // .choices[0].text // empty')
    if [ -z "$content" ]; then
      # Fallback to showing the raw response structure for debugging
      echo "Unexpected response format:"
      echo "$response" | jq '{
        id: .id,
        object: .object,
        model: .model,
        choices: [.choices[] | {
          index: .index,
          message: .message // .text,
          finish_reason: .finish_reason
        }]
      }'
    else
      echo "$content"
    fi
    echo "Response time: $(printf "%.2f" $elapsed)s"
  fi
else
  echo "PhotoTest.JPG file not found, skipping vision test"
fi

# Test llm-diary (port 8003) - test with a prompt
echo -e "\nTesting llm-diary (port 8003) with diary prompt:"
start_time=$(date +%s.%N)
response=$(curl -s -X POST http://localhost:8003/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/Llama-3.1-8B-Instruct-NVFP4", "prompt": "Today I felt", "max_tokens": 20}')
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)
echo "$response" | jq '.choices[0].text'
echo "Response time: $(printf "%.2f" $elapsed)s"

# Test stt-whisper (port 8004) - check if port is open
echo -e "\nTesting stt-whisper (port 8004) connectivity:"
start_time=$(date +%s.%N)
if nc -z localhost 8004; then
  result="Port 8004 is open"
else
  result="Port 8004 is not accessible"
fi
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)
echo "$result"
echo "Response time: $(printf "%.2f" $elapsed)s"

# Test tts-xtts (port 8020) - check if port is open
echo -e "\nTesting tts-xtts (port 8020) connectivity:"
start_time=$(date +%s.%N)
if nc -z localhost 8020; then
  result="Port 8020 is open"
else
  result="Port 8020 is not accessible"
fi
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)
echo "$result"
echo "Response time: $(printf "%.2f" $elapsed)s"

# Test minime-t5 (port 8082) - check if port is open
echo -e "\nTesting minime-t5 (port 8082) connectivity:"
start_time=$(date +%s.%N)
if nc -z localhost 8082; then
  result="Port 8082 is open"
else
  result="Port 8082 is not accessible"
fi
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)
echo "$result"
echo "Response time: $(printf "%.2f" $elapsed)s"

echo -e "\nTesting complete."
