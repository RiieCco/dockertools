#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

PROJECT_FOLDER="${PROJECT_FOLDER:-/project}"
OUTPUT_FOLDER="${OUTPUT_FOLDER:-/project}"
OUTPUT_FORMAT="${OUTPUT_FORMAT:-XML}"


[ -z "${IP}" ] && exit_env_error IP
[ -z "${DOJO_URL}" ] && exit_env_error DOJO_URL
[ -z "${DOJO_ENGAGEMENT_ID}" ] && exit_env_error DOJO_ENGAGEMENT_ID
[ -z "${DOJO_API_KEY}" ] && exit_env_error DOJO_API_KEY

nmap -sT -sV -p- -P0 -oX result.xml "${IP}" 


curl -k --request POST --url "${DOJO_URL}"/api/v1/importscan/ --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' --header 'cache-control: no-cache' --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' --form minimum_severity=Info --form scan_date=2018-05-01 --form verified=False --form file=@result.xml --form tags=Test_automation --form active=True --form engagement=/api/v1/engagements/"${DOJO_ENGAGEMENT_ID}"/ --form 'scan_type=Nmap Scan'
