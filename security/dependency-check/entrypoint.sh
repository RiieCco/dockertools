#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

PROJECT_FOLDER="${PROJECT_FOLDER:-/project}"
OUTPUT_FOLDER="${OUTPUT_FOLDER:-/output}"
OUTPUT_FORMAT="${OUTPUT_FORMAT:-XML}"


[ -z "${SOURCE_REPO}" ] && exit_env_error SOURCE_REPO
[ -z "${SCAN_SOURCE} "] && exit_env_error SCAN_SOURCE

rm -rf "${PROJECT_FOLDER}" "${OUTPUT_FOLDER}"
git clone "${SOURCE_REPO}" "${PROJECT_FOLDER}"

mkdir -p "${OUTPUT_FOLDER}"

/opt/dependency-check/bin/dependency-check.sh \
    --project "${PROJECT_FOLDER}" \
    --format "${OUTPUT_FORMAT}" \
    --out "${OUTPUT_FOLDER}" \
    --enableExperimental \
    --scan "${SCAN_SOURCE}/**"

cat "${OUTPUT_FOLDER}/dependency-check-report.xml"
#curl --insecure -H 'Accept: application/json' -X POST --form "file=@${OUTPUT_FOLDER}/dependency-check-report.xml" 'https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={7M8Uw9RLqkobJJe1rcIHElOSGbTuAAuUHHNpgmMVP58}'
