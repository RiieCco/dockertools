#!/bin/bash

exit_env_error() {
echo "Error: env var '${1}' not set" >&2
exit 1
}

[ -z "${SOURCE_REPO}" ] && exit_env_error SOURCE_REPO
[ -z "${APK_NAME}" ] && exit_env_error APK_NAME
[ -z "${MOBSF_ENGINE_URL}" ] && exit_env_error MOBSF_ENGINE_URL
[ -z "${MOBSF_API_KEY}" ] && exit_env_error MOBSF_API_KEY
[ -z "${DOJO_URL}" ] && exit_env_error DOJO_URL
[ -z "${DOJO_ENGAGEMENT_ID}" ] && exit_env_error DOJO_ENGAGEMENT_ID
[ -z "${DOJO_API_KEY}" ] && exit_env_error DOJO_API_KEY

rm -rf project
git clone "${SOURCE_REPO}" project

pwd
cd project
ls
pwd
curl -F 'file=@/scanner/project/'${APK_NAME}'' ${MOBSF_ENGINE_URL}/api/v1/upload -H "Authorization:${MOBSF_API_KEY}" | jq --raw-output ".hash" > hash.txt
HASH=$(cat hash.txt)

curl -X POST --url ${MOBSF_ENGINE_URL}/api/v1/scan --data "scan_type=apk&file_name=${APK_NAME}&hash=${HASH}" -H "Authorization:${MOBSF_API_KEY}"
echo "//////////////////"
echo $HASH
echo "//////////////////"

#sleep 100

curl -X POST --url ${MOBSF_ENGINE_URL}/api/v1/report_json --data "hash=${HASH}&scan_type=apk" -H "Authorization:${MOBSF_API_KEY}" > result.json

SCAN_DATE=`date +%Y-%m-%d`

cat result.json | jq

curl --request POST \
    --url "${DOJO_URL}"/api/v1/importscan/ \
    --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' \
    --header 'cache-control: no-cache' \
    --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
    --form minimum_severity=Info \
    --form scan_date="${SCAN_DATE}" \
    --form verified=False \
    --form file=@result.json \
    --form tags=Test_automation \
    --form active=True \
    --form engagement=/api/v1/engagements/"${DOJO_ENGAGEMENT_ID}"/ \
    --form 'scan_type=MobSF Scan'