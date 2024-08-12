#!/bin/bash

URL="https://www.youtube.com/watch?v=Nqs9iyn7tOo"
PORT=6000
QUALITY="best"
RETRY_OPEN=30
RETRY_MAX=0
SEGMENT_TIMEOUT=600
STREAM_TIMEOUT=900
BUFFER_SIZE="64M"

while true; do
    echo "Starting streamlink..."
    streamlink $URL $QUALITY \
        --player-external-http \
        --player-external-http-port $PORT \
        --retry-open $RETRY_OPEN \
        --retry-max $RETRY_MAX \
        --stream-segment-timeout $SEGMENT_TIMEOUT \
        --stream-timeout $STREAM_TIMEOUT \
        --ringbuffer-size $BUFFER_SIZE

    echo "Streamlink stopped. Restarting in 5 seconds..."
    sleep 5
done
