#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

DEFAULT_RESULT_FILE="$(hostname).results.json"
RESULT_FILE="${RESULT_FILE:-${DEFAULT_RESULT_FILE}}"
FOLDER="${FOLDER:-/application}"

[ -z "${REPO}" ] && exit_env_error REPO


#[ -z "${ARTIFACTORY_USER}" ] && exit_env_error ARTIFACTORY_USER
#[ -z "${ARTIFACTORY_EMAIL}" ] && exit_env_error ARTIFACTORY_EMAIL
#[ -z "${ARTIFACTORY_PWHASH}" ] && exit_env_error ARTIFACTORY_PWHASH

#[ -z "${JIRA_PROXY_BASEURL}" ] && exit_env_error JIRA_PROXY_BASEURL # http://172.17.0.1:1337/api
#[ -z "${JIRA_API_TOKEN}" ]  && exit_env_error JIRA_API_TOKEN
#[ -z "${JIRA_USER}" ]  && exit_env_error JIRA_USER
#[ -z "${JIRA_PASSWD}" ]  && exit_env_error JIRA_PASSWD

postResults() {
    curl -H "Content-Type: application/json" -X POST -d "$(sprintf '{"username": "%s", "password":"%s"}' "${JIRA_USER}" "${JIRA_PASSWD}")" "${JIRA_PROXY_BASEURL}/Login?token=${JIRA_API_TOKEN}"
    curl -H "Content-Type: application/json" -X GET "${JIRA_PROXY_BASEURL}/SyncIssue/Update?token=${JIRA_API_TOKEN}"
    curl -H "Content-Type: application/json" -X POST --form "files=@${RESULT_FILE}" "${JIRA_PROXY_BASEURL}/RetireJS?token=${JIRA_API_TOKEN}"
    curl -H "Content-Type: multipart/form-data" -X POST -F "files=@${RESULT_FILE};filename=retire.json" "${JIRA_PROXY_BASEURL}/RetireJS?token=${JIRA_API_TOKEN}"
    curl -H "Content-Type: application/json" -X GET  "${JIRA_PROXY_BASEURL}/SyncIssue/New?token=${JIRA_API_TOKEN}"
}

main() {
    if [ -d "${FOLDER}" ]; then rm -rf "${FOLDER}"; fi
    git clone "${REPO}" "${FOLDER}"
    
    cd "${FOLDER}"
    npm install

    retire -p --outputformat json 
    retire --outputpath "${RESULT_FILE}"
   
}

main

