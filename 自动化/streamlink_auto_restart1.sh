#!/bin/bash

# 配置
API_KEY="YOUR_YOUTUBE_API_KEY"  # 替换为你的 YouTube API 密钥
CHANNEL_ID="UCbCCUH8S3yhlm7__rhxR2QQ"  # 替换为你要检测的 YouTube 频道 ID
PORT=6000
QUALITY="best"
RETRY_OPEN=30
RETRY_MAX=0
SEGMENT_TIMEOUT=600
STREAM_TIMEOUT=900
BUFFER_SIZE="64M"
CHECK_INTERVAL=60  # 检查间隔时间，单位为秒

while true; do
    echo "Checking for live stream..."
    API_RESPONSE=$(curl -s "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$CHANNEL_ID&eventType=live&type=video&key=$API_KEY")
    VIDEO_ID=$(echo "$API_RESPONSE" | jq -r '.items[0].id.videoId')

    if [[ -z $VIDEO_ID || $VIDEO_ID == "null" ]]; then
        echo "No live stream detected. Checking again in $CHECK_INTERVAL seconds..."
    else
        LIVE_URL="https://www.youtube.com/watch?v=$VIDEO_ID"
        echo "Live stream detected: $LIVE_URL"
        echo "Starting streamlink..."
        streamlink $LIVE_URL $QUALITY \
            --player-external-http \
            --player-external-http-port $PORT \
            --retry-open $RETRY_OPEN \
            --retry-max $RETRY_MAX \
            --stream-segment-timeout $SEGMENT_TIMEOUT \
            --stream-timeout $STREAM_TIMEOUT \
            --ringbuffer-size $BUFFER_SIZE

        echo "Streamlink stopped. Restarting check in $CHECK_INTERVAL seconds..."
    fi

    sleep $CHECK_INTERVAL
done
