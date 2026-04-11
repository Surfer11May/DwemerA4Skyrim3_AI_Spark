#!/bin/bash
# Test script for llm-vision service in the Skyrim-Full-Stack
echo "Testing llm-vision service..."
echo "============================="

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
    # Send request and measure time
    START_TIME=$(date +%s%3N)
    RESPONSE=$(curl -s -X POST http://localhost:8002/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d "$JSON_PAYLOAD")
    END_TIME=$(date +%s%3N)
    RESPONSE_TIME=$((END_TIME - START_TIME))
    echo "Vision response time: ${RESPONSE_TIME}ms"
    echo "$RESPONSE" | jq '.choices[0].message.content'
  fi
else
  echo "PhotoTest.JPG file not found, skipping vision test"
fi

echo -e "\nVision test complete."
