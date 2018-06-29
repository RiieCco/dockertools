#!/bin/bash

exit_env_error() {
echo "Error: env var '${1}' not set" >&2
exit 1
}

[ -z "${SOURCE_REPO_APK_RAW}" ] && exit_env_error SOURCE_REPO_APK_RAW
[ -z "${MOBSF_ENGINE_URL}" ] && exit_env_error MOBSF_ENGINE_URL
[ -z "${MOBSF_API_KEY}" ] && exit_env_error MOBSF_API_KEY

curl "${SOURCE_REPO_APK_RAW}" > test.apk

export HASH="$(curl -F 'file=@test.apk' ${MOBSF_ENGINE_URL}/api/v1/upload -H "Authorization:${MOBSF_API_KEY}" | grep "hash" | cut -d: -f2 | cut -d \" -f2)"

curl -X POST --url ${MOBSF_ENGINE_URL}/api/v1/scan --data "scan_type=apk&file_name=diva.apk&hash=${HASH}" -H "Authorization:${MOBSF_API_KEY}"
curl -X POST --url ${MOBSF_ENGINE_URL}/api/v1/report_json --data "hash=$HASH&scan_type=apk" -H "Authorization:${MOBSF_API_KEY}" > /project/result.json

unset HASH
