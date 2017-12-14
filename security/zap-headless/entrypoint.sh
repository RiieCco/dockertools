#!/bin/bash

ZAP_HOST="${ZAP_HOST:-0.0.0.0}"
ZAP_PORT="${ZAP_PORT:-80}"
SESSION_PATH="/session-data"

ARGS="
    -daemon
    -host ${ZAP_HOST}
    -port ${ZAP_PORT}
    -config api.key=testingandwrestlin
    -config api.addrs.addr.name=.*
    -config api.addrs.addr.regex=true
    -addoninstallall
"

if [ -d "${SESSION_PATH}" ]; then
    ARGS="${ARGS} -session ${SESSION_PATH}"
else
    mkdir -p "${SESSION_PATH}"
    ARGS="${ARGS} -newsession ${SESSION_PATH}"
fi

exec /opt/zap/zap.sh ${ARGS}
