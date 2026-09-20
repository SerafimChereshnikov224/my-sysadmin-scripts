#!/bin/bash

INTERVAL=10
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG="$SCRIPT_DIR/monitor.log"

if [ ! -w "$SCRIPT_DIR" ]; then
    echo "Ошибка: нет прав на запись в $SCRIPT_DIR" >&2
    exit 1
fi

if [ -e "$LOG" ] && [ ! -w "$LOG" ]; then
    echo "Ошибка: нет прав на запись в $LOG" >&2
    exit 1
fi

while true; do
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        free -h
        df -h
        uptime
        echo
    } >> "$LOG" || { echo "Ошибка записи в $LOG" >&2; exit 1; }

    sleep "$INTERVAL"
done
