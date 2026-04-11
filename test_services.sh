#!/bin/bash
# Test script for all services in the Skyrim-Full-Stack
echo "Testing Skyrim-Full-Stack services..."
echo "===================================="

# Clear any existing variables that might interfere
unset MODEL_ID BASE64_IMAGE JSON_PAYLOAD RESPONSE START_TIME END_TIME RESPONSE_TIME RESPONSE_TEXT APPROX_TOKENS TPS

# Test llm-standard (port 8000)
echo -e "\nTesting llm-standard (port 8000):"
START_TIME=$(date +%s%3N)
RESPONSE=$(curl -s -X POST http://localhost:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/NVIDIA-Nemotron-3-Nano-30B-A3B-NVFP4", "prompt": "Skyrim is", "max_tokens": 20}')
END_TIME=$(date +%s%3N)
RESPONSE_TIME=$((END_TIME - START_TIME))
RESPONSE_TEXT=$(echo "$RESPONSE" | jq -r '.choices[0].text')
# Approximate token count (rough estimate: 4 chars per token)
APPROX_TOKENS=${#RESPONSE_TEXT}
APPROX_TOKENS=$((APPROX_TOKENS / 4))
if [ $APPROX_TOKENS -eq 0 ]; then
  APPROX_TOKENS=1
fi
TPS=$((APPROX_TOKENS * 1000 / RESPONSE_TIME))
if [ $TPS -eq 0 ]; then
  TPS=1
fi
echo "Response time: ${RESPONSE_TIME}ms"
echo "Approximate tokens: $APPROX_TOKENS"
echo "Tokens per second: $TPS"
echo "$RESPONSE_TEXT"

# Test llm-fast (port 8001)
echo -e "\nTesting llm-fast (port 8001):"
START_TIME=$(date +%s%3N)
RESPONSE=$(curl -s -X POST http://localhost:8001/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/nemotron-nano-9b-v2", "prompt": "The Dragonborn", "max_tokens": 20}')
END_TIME=$(date +%s%3N)
RESPONSE_TIME=$((END_TIME - START_TIME))
RESPONSE_TEXT=$(echo "$RESPONSE" | jq -r '.choices[0].text')
# Approximate token count (rough estimate: 4 chars per token)
APPROX_TOKENS=${#RESPONSE_TEXT}
APPROX_TOKENS=$((APPROX_TOKENS / 4))
if [ $APPROX_TOKENS -eq 0 ]; then
  APPROX_TOKENS=1
fi
TPS=$((APPROX_TOKENS * 1000 / RESPONSE_TIME))
if [ $TPS -eq 0 ]; then
  TPS=1
fi
echo "Response time: ${RESPONSE_TIME}ms"
echo "Approximate tokens: $APPROX_TOKENS"
echo "Tokens per second: $TPS"
echo "$RESPONSE_TEXT"

# Test llm-vision (port 8002) - describe an image
echo -e "\nTesting llm-vision (port 8002) image description:"
if [ -f "PhotoTest.JPG" ]; then
  # First run: get description
  # Get the first available model
  MODEL_ID=$(curl -s http://localhost:8002/v1/models | jq -r '.data[0].id')
  if [ -z "$MODEL_ID" ] || [ "$MODEL_ID" = "null" ]; then
    echo "Failed to get model ID from llm-vision"
  else
    # Encode image to base64
    BASE64_IMAGE=$(base64 -w 0 "PhotoTest.JPG")
    # Create JSON payload
    JSON_PAYLOAD=$(cat <<EOF
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
)
    # Send request and get description
    START_TIME=$(date +%s%3N)
    RESPONSE=$(curl -s -X POST http://localhost:8002/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d "$JSON_PAYLOAD")
    END_TIME=$(date +%s%3N)
    RESPONSE_TIME=$((END_TIME - START_TIME))
    echo "Vision response time: ${RESPONSE_TIME}ms"
    echo "$RESPONSE" | jq '.choices[0].message.content'
    
    # Clear variables for second run
    unset MODEL_ID BASE64_IMAGE JSON_PAYLOAD RESPONSE START_TIME END_TIME RESPONSE_TIME
    
    # Second run: just measure response time (no output of description)
    # Get the first available model again
    MODEL_ID=$(curl -s http://localhost:8002/v1/models | jq -r '.data[0].id')
    if [ -z "$MODEL_ID" ] || [ "$MODEL_ID" = "null" ]; then
      echo "Failed to get model ID from llm-vision (second run)"
    else
      # Encode image to base64 again
      BASE64_IMAGE=$(base64 -w 0 "PhotoTest.JPG")
      # Create JSON payload again
      JSON_PAYLOAD=$(cat <<EOF
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
)
      # Send request and measure time only
      START_TIME=$(date +%s%3N)
      RESPONSE=$(curl -s -X POST http://localhost:8002/v1/chat/completions \
        -H "Content-Type: application/json" \
        -d "$JSON_PAYLOAD")
      END_TIME=$(date +%s%3N)
      RESPONSE_TIME=$((END_TIME - START_TIME))
      echo "Vision response time (measured): ${RESPONSE_TIME}ms"
      
      # Clear variables after second run
      unset MODEL_ID BASE64_IMAGE JSON_PAYLOAD RESPONSE START_TIME END_TIME RESPONSE_TIME
    fi
  fi
else
  echo "PhotoTest.JPG file not found, skipping vision test"
fi

# Test llm-diary (port 8003) - test with a prompt
echo -e "\nTesting llm-diary (port 8003) with diary prompt:"
START_TIME=$(date +%s%3N)
RESPONSE=$(curl -s -X POST http://localhost:8003/v1/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "nvidia/Llama-3.1-8B-Instruct-NVFP4", "prompt": "Today I felt", "max_tokens": 20}')
END_TIME=$(date +%s%3N)
RESPONSE_TIME=$((END_TIME - START_TIME))
RESPONSE_TEXT=$(echo "$RESPONSE" | jq -r '.choices[0].text')
# Approximate token count (rough estimate: 4 chars per token)
APPROX_TOKENS=${#RESPONSE_TEXT}
APPROX_TOKENS=$((APPROX_TOKENS / 4))
if [ $APPROX_TOKENS -eq 0 ]; then
  APPROX_TOKENS=1
fi
TPS=$((APPROX_TOKENS * 1000 / RESPONSE_TIME))
if [ $TPS -eq 0 ]; then
  TPS=1
fi
echo "Response time: ${RESPONSE_TIME}ms"
echo "Approximate tokens: $APPROX_TOKENS"
echo "Tokens per second: $TPS"
echo "$RESPONSE_TEXT"

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

# Clear any variables at the end
unset MODEL_ID BASE64_IMAGE JSON_PAYLOAD RESPONSE START_TIME END_TIME RESPONSE_TIME RESPONSE_TEXT APPROX_TOKENS TPS

echo -e "\nTesting complete."
