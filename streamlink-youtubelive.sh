#!/bin/bash

# 配置
CHANNEL_ID="UCXXXXXX"  # 替换为你要检测的 YouTube 用户频道 ID
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
    LIVE_URL=$(yt-dlp -g "https://www.youtube.com/channel/$CHANNEL_ID/live" --get-url)

    if [[ $LIVE_URL == *"youtube"* ]]; then
        echo "Live stream detected! Starting streamlink..."
        streamlink $LIVE_URL $QUALITY \
            --player-external-http \
            --player-external-http-port $PORT \
            --retry-open $RETRY_OPEN \
            --retry-max $RETRY_MAX \
            --stream-segment-timeout $SEGMENT_TIMEOUT \
            --stream-timeout $STREAM_TIMEOUT \
            --ringbuffer-size $BUFFER_SIZE

        echo "Streamlink stopped. Restarting check in $CHECK_INTERVAL seconds..."
    else
        echo "No live stream detected. Checking again in $CHECK_INTERVAL seconds..."
    fi

    sleep $CHECK_INTERVAL
done
