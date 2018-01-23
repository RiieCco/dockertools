#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

RESULT_FILE="/tmp/$$.$(hostname).results.json"

[ -z "${ZAP_KEY}" ] && exit_env_error ZAP_KEY
[ -z "${ZAP_PROXY}" ] && exit_env_error ZAP_PROXY
[ -z "${TARGET}" ] && exit_env_error TARGET
[ -z "${SWAGGER}" ] && exit_env_error SWAGGER
[ -z "${AUTH_TOKEN}" ] && exit_env_error AUTH_TOKEN

#[ -z "${JIRA_PROXY_BASEURL}" ] && exit_env_error JIRA_PROXY_BASEURL # http://172.17.0.1:1337/api
#[ -z "${JIRA_API_TOKEN}" ]  && exit_env_error JIRA_API_TOKEN
#[ -z "${JIRA_USER}" ]  && exit_env_error JIRA_USER
#[ -z "${JIRA_PASSWD}" ]  && exit_env_error JIRA_PASSWD

python /api-scan-auth-header.py --zap_key "${ZAP_KEY}" --zap_proxy "${ZAP_PROXY}" --target "${TARGET}" --swagger "${SWAGGER}" --auth_token "${AUTH_TOKEN}"

# post to Jira
#curl -H "Content-Type: application/json" -X POST -d "$(sprintf '{"username": "%s", "password":"%s"}' "${JIRA_USER}" "${JIRA_PASSWD}")" "${JIRA_PROXY_BASEURL}/Login?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: application/json" -X GET "${JIRA_PROXY_BASEURL}/SyncIssue/Update?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: multipart/form-data" -X POST -F "files=@${RESULT_FILE};filename=ZAPscan.xml" "${JIRA_PROXY_BASEURL}/ZAP?token=${JIRA_API_TOKEN}"
#curl -H "Content-Type: application/json" -X GET  "${JIRA_PROXY_BASEURL}/SyncIssue/New?token=${JIRA_API_TOKEN}"
