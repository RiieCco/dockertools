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

while IFS=',' read -ra ADDR; do
      for i in "${ADDR[@]}"; do
          echo "$i is scanning now"
          "${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" image add "${IMAGES}"
          echo "scan for $i is done"
      done
 done <<< "${IMAGES}"
 
#give the scanner some time to analyze al the images
#sleep(240)

while IFS=',' read -ra ADDR; do
      for i in "${ADDR[@]}"; do
          echo "$i is scanning now"
          "${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" --json image vuln "${IMAGES}" os
          echo "scan for $i is done"
      done
 done <<< "${IMAGES}"


