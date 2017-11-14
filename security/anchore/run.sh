#!/bin/bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

#authentication to the registry
#anchore-cli --u $anchor_user --p $anchor_pass --url $anchor_url registry add $registry_url $registry_user $registry_pass
#anchore-cli --u $anchor_user --p $anchor_pass --url $anchor_url registry get docker.tntdigital.io

#analyzing and scanning the target
anchore-cli --u $anchor_user --p $anchor_pass --url $anchor_url image list
anchore-cli --u $anchor_user --p $anchor_pass --url $anchor_url image add jenkins:latest
anchore-cli --json --u $anchor_user --p $anchor_pass --url $anchor_url image vuln jenkins:latest os

: <<'END'
Tool usage example:
sudo docker run anchore  \
--anchor_user admin
--anchor_pass foobar
--anchor_url http://localhost/:8228/v1
--registry_user test
--registry_pass test
--registry_url https://docker.company.io
--images  docker.company.io/image:foo, docker.company.io/image:bar, etc
--resultSource https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={AgdLRap39VUEnBUajxZjoeKKunIv7psnBeH33vFfU}
END
