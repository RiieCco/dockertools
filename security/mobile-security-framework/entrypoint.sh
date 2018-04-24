#!/bin/bash

exit_env_error() {
echo "Error: env var '${1}' not set" >&2
exit 1
}

[ -z "${SOURCE_REPO}" ] && exit_env_error SOURCE_REPO
[ -z "${ENGINE_IP}" ] && exit_env_error SOURCE_REPO
[ -z "${API_KEY}" ] && exit_env_error SOURCE_REPO

curl "${SOURCE_REPO}" > test.apk

cat test.apk

export HASH="$(curl -F 'file=@test.apk' ${ENGINE_IP}/api/v1/upload -H "Authorization:${API_KEY}" | grep "hash" | cut -d: -f2 | cut -d \" -f2)"

curl -X POST --url ${ENGINE_IP}/api/v1/scan --data "scan_type=apk&file_name=diva.apk&hash=${HASH}" -H "Authorization:${API_KEY}"
curl -X POST --url ${ENGINE_IP}/api/v1/report_json --data "hash=$HASH&scan_type=apk" -H "Authorization:${API_KEY}" > result.json

cat result.json
unset HASH
