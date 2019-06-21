#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

[ -z "${SOURCE_REPO}" ] && exit_env_error SOURCE_REPO
[ -z "${DOJO_URL}" ] && exit_env_error DOJO_URL
[ -z "${DOJO_ENGAGEMENT_ID}" ] && exit_env_error DOJO_ENGAGEMENT_ID
[ -z "${DOJO_API_KEY}" ] && exit_env_error DOJO_API_KEY

trufflehog --regex --json --entropy=False "${SOURCE_REPO}" > output.json | exit 0
ls -lart
cat output.json

SCAN_DATE=`date +%Y-%m-%d`

curl --request POST \
    --url "${DOJO_URL}"/api/v1/importscan/ \
    --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' \
    --header 'cache-control: no-cache' \
    --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
    --form minimum_severity=Info \
    --form scan_date="${SCAN_DATE}" \
    --form verified=False \
    --form file=@"${PROJECT_FOLDER}"/output.json \
    --form tags=Test_automation \
    --form active=True \
    --form engagement=/api/v1/engagements/"${DOJO_ENGAGEMENT_ID}"/ \
    --form 'scan_type=Trufflehog Scan'
