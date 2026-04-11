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
    } | {
      # Use a subshell to capture both the response and timing
      RESPONSE=$(curl -s -D - -w "%{time_total}" -o /dev/null -X POST http://localhost:8002/v1/chat/completions \
        -H "Content-Type: application/json" \
        -d @- 2>/dev/null)
      # Actually, let's do this properly - capture response and time separately
      START_TIME=$(date +%s%3N)
      RESPONSE=$(curl -s -X POST http://localhost:8002/v1/chat/completions \
        -H "Content-Type: application/json" \
        -d @-)
      END_TIME=$(date +%s%3N)
      RESPONSE_TIME=$((END_TIME - START_TIME))
      echo "Vision response time: ${RESPONSE_TIME}ms"
      echo "$RESPONSE" | jq '.choices[0].message.content'
    }
  fi
else
  echo "PhotoTest.JPG file not found, skipping vision test"
fi

echo -e "\nVision test complete."
