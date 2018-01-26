#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

ANCHORE_BIN=/usr/local/bin/anchore-cli

[ -z "${ANCHOR_USER}" ] && exit_env_error ANCHOR_USER
[ -z "${ANCHOR_PASS}" ] && exit_env_error ANCHOR_PASS
[ -z "${ANCHOR_URL}" ] && exit_env_error ANCHOR_URL
[ -z "${IMAGES}" ] && exit_env_error IMAGES

#authentication to the registry
#anchore-cli --u $ANCHOR_USER --p $ANCHOR_PASS --url $ANCHOR_URL registry add $REGISTRY_URL $REGISTRY_USER $REGISTRY_PASS
#anchore-cli --u $ANCHOR_USER --p $ANCHOR_PASS --url $ANCHOR_URL registry get $REGISTRY_URL

#analyzing and scanning the target
"${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" image list

while IFS=',' read -ra IMAGE; do
      for i in "${IMAGE[@]}"; do
          echo "$i is added to list"
          "${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" image add "$i"
          echo "adding $i to list is done"
      done
 done <<< "${IMAGES}"
 
#give the scanner some time to analyze al the images
#sleep(240)

while IFS=',' read -ra IMAGE; do
      for i in "${IMAGE[@]}"; do
          echo "$i is scanning now"
          "${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" --json image vuln "$i" os
          echo "scan for $i is done"
          
          #Here we will also post results to the JIRA API
          #curl -H "Content-Type: application/json" -X POST -d "$(sprintf '{"username": "%s", "password":"%s"}' "${JIRA_USER}" "${JIRA_PASSWD}")" "${JIRA_PROXY_BASEURL}/Login?token=${JIRA_API_TOKEN}"
          #curl -H "Content-Type: application/json" -X GET "${JIRA_PROXY_BASEURL}/SyncIssue/Update?token=${JIRA_API_TOKEN}"
          #curl -H "Content-Type: application/json" -X POST --form "files=@${RESULT_FILE}" "${JIRA_PROXY_BASEURL}/RetireJS?token=${JIRA_API_TOKEN}"
          #curl -H "Content-Type: multipart/form-data" -X POST -F "files=@${RESULT_FILE};filename=retire.json" "${JIRA_PROXY_BASEURL}/RetireJS?token=${JIRA_API_TOKEN}"
          #curl -H "Content-Type: application/json" -X GET  "${JIRA_PROXY_BASEURL}/SyncIssue/New?token=${JIRA_API_TOKEN}"
         
      done
 done <<< "${IMAGES}"


