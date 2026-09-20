#!/bin/bash

INTERVAL=10
LOG=monitor.log

while true; do
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        free -h
        df -h
        uptime
        echo
    } >> "$LOG"
    sleep "$INTERVAL"
done
