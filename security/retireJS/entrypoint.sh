#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

DEFAULT_RESULT_FILE="$(hostname).results.json"
RESULT_FILE="${RESULT_FILE:-${DEFAULT_RESULT_FILE}}"
FOLDER="${FOLDER:-/application}"

[ -z "${IS_NPM}" ] && exit_env_error APPLICATION_ROOT
[ -z "${DOJO_URL}" ] && exit_env_error DOJO_URL
[ -z "${DOJO_ENGAGEMENT_ID}" ] && exit_env_error DOJO_ENGAGEMENT_ID
[ -z "${DOJO_API_KEY}" ] && exit_env_error DOJO_API_KEY


#[ -z "${ARTIFACTORY_USER}" ] && exit_env_error ARTIFACTORY_USER
#[ -z "${ARTIFACTORY_EMAIL}" ] && exit_env_error ARTIFACTORY_EMAIL
#[ -z "${ARTIFACTORY_PWHASH}" ] && exit_env_error ARTIFACTORY_PWHASH

#export ARTIFACTORY_USER=${ARTIFACTORY_USER}
#export ARTIFACTORY_EMAIL=${ARTIFACTORY_EMAIL}
#export ARTIFACTORY_PASSWORD_HASH=${ARTIFACTORY_PWHASH}

#npm config set @artifactory:registry https://company.artifactoryonline.com/company/api/npm/npm-local/


cd "${FOLDER}/${APPLICATION_ROOT}"
if [ "$IS_NPM" == "True" ]; then
    npm install
    retire -p --outputformat json 
    retire --outputpath "${RESULT_FILE}"
    curl --request POST --url "${DOJO_URL}"/api/v1/importscan/ --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' --header 'cache-control: no-cache' --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' --form minimum_severity=Info --form scan_date=2018-05-01 --form verified=False --form file=@"${RESULT_FILE}" --form tags=test_automation --form scan_type='Dependency Check Scan'
else
    retire -p --outputformat json 
    retire --outputpath "${RESULT_FILE}"
    curl --request POST --url "${DOJO_URL}"/api/v1/importscan/ --header 'authorization: ApiKey '"${DOJO_API_KEY}"' ' --header 'cache-control: no-cache' --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' --form minimum_severity=Info --form scan_date=2018-05-01 --form verified=False --form file=@"${RESULT_FILE}" --form tags=test_automation --form scan_type='Dependency Check Scan'

fi



#curl -H "Content-Type: application/json" -X POST -d "$(sprintf '{"username": "%s", "password":"%s"}' "${JIRA_USER}" "${JIRA_PASSWD}")" "${JIRA_PROXY_BASEURL}/Login?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: application/json" -X GET "${JIRA_PROXY_BASEURL}/SyncIssue/Update?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: application/json" -X POST --form "files=@${RESULT_FILE}" "${JIRA_PROXY_BASEURL}/RetireJS?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: multipart/form-data" -X POST -F "files=@${RESULT_FILE};filename=retire.json" "${JIRA_PROXY_BASEURL}/RetireJS?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: application/json" -X GET  "${JIRA_PROXY_BASEURL}/SyncIssue/New?token=${JIRA_API_TOKEN}"

   


