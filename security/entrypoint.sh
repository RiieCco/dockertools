#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

PROJECT_FOLDER="${PROJECT_FOLDER:-/project}"
OUTPUT_FORMAT="${OUTPUT_FORMAT:-json}"
VALIDATE_DOJO_CERTIFICATE="${VALIDATE_DOJO_CERTIFICATE:-true}"

[ -z "${SOURCE_REPO}" ] && exit_env_error SOURCE_REPO
[ -z "${DOJO_URL}" ] && exit_env_error DOJO_URL
[ -z "${DOJO_ENGAGEMENT_ID}" ] && exit_env_error DOJO_ENGAGEMENT_ID
[ -z "${DOJO_API_KEY}" ] && exit_env_error DOJO_API_KEY

git clone "${SOURCE_REPO}" "${PROJECT_FOLDER}"

cd /"${PROJECT_FOLDER}"

bandit -r . \
    --format "${OUTPUT_FORMAT}" \
    --output "bandit-report.${OUTPUT_FORMAT}" | exit 0


SCAN_DATE=`date +%Y-%m-%d`

if [ $VALIDATE_DOJO_CERTIFICATE ]
then
        VALIDATE_OPT=""
else
        VALIDATE_OPT="-k"
fi

curl "${VALIDATE_OPT}" \
    --request POST \
    --url "${DOJO_URL}"/api/v1/importscan/ \
    --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' \
    --header 'cache-control: no-cache' \
    --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
    --form minimum_severity=Info \
    --form scan_date="${SCAN_DATE}" \
    --form verified=False \
    --form file=@"${PROJECT_FOLDER}"/bandit-report."${OUTPUT_FORMAT}" \
    --form tags=Test_automation \
    --form active=True \
    --form engagement=/api/v1/engagements/"${DOJO_ENGAGEMENT_ID}"/ \
    --form 'scan_type=Bandit Scan'
