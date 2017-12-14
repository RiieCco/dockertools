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

#authentication to the registry
#anchore-cli --u $anchor_user --p $anchor_pass --url $anchor_url registry add $registry_url $registry_user $registry_pass
#anchore-cli --u $anchor_user --p $anchor_pass --url $anchor_url registry get docker.tntdigital.io

#analyzing and scanning the target
"${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" image list
"${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" image add docker.io/library/debian:latest
"${ANCHORE_BIN}" --u "${ANCHOR_USER}" --p "${ANCHOR_PASS}" --url "${ANCHOR_URL}" --json image vuln docker.io/library/debian:latest os

# Tool usage example:
# docker run --rm -it local/anchore-cli:latest
# --anchor_user admin
# --anchor_pass foobar
# --anchor_url http://localhost/:8228/v1
# --registry_user test
# --registry_pass test
# --registry_url https://docker.company.io
# --images  docker.company.io/image:foo, docker.company.io/image:bar, etc
# --resultSource https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={AgdLRap39VUEnBUajxZjoeKKunIv7psnBeH33vFfU}
