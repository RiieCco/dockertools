#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}


PROJECT_FOLDER="${PROJECT_FOLDER:-/project}"

[ -z "${SOURCE_REPO}" ] && exit_env_error SOURCE_REPO
[ -z "${DOJO_URL}" ] && exit_env_error DOJO_URL
[ -z "${DOJO_ENGAGEMENT_ID}" ] && exit_env_error DOJO_ENGAGEMENT_ID
[ -z "${DOJO_API_KEY}" ] && exit_env_error DOJO_API_KEY


rm -rf "${PROJECT_FOLDER}" "${PROJECT_FOLDER}"
git clone "${SOURCE_REPO}" "${PROJECT_FOLDER}"

cd /"${PROJECT_FOLDER}"

npm install 
npm audit --json > "/${PROJECT_FOLDER}"/report.json | exit 0

cat "/${PROJECT_FOLDER}"/report.json

scanDate = date "+%y-%m-%d"
curl -k --request POST --url "${DOJO_URL}"/api/v1/importscan/ --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' --header 'cache-control: no-cache' --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' --form minimum_severity=Info --form scan_date="${scanDate}" --form verified=False --form file=@"${PROJECT_FOLDER}"/report.json --form tags=Test_automation --form active=True --form engagement=/api/v1/engagements/"${DOJO_ENGAGEMENT_ID}"/ --form 'scan_type=NPM Audit Scan'

