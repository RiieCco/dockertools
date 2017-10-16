#!/bin/bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done



  
if [ -d $projectFolder ]; then rm -rf $projectFolder; fi
git config --global user.email "r.tencate77@gmail.com"
git config --global user.name "Riiecco"
git clone $sourceRepo

./../dependency-check/bin/dependency-check.sh --project $projectFolder  --format "XML" --out . --scan $sourceToScan/**
curl --insecure -H 'Accept: application/json' -X POST --form "file=@./dependency-check-report.xml" 'https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={7M8Uw9RLqkobJJe1rcIHElOSGbTuAAuUHHNpgmMVP58}'

: <<'END'
Tool usage example:

sudo docker run dep  \
--sourceRepo ${value["repository"]} \
--projectFolder ${value["projectFolder"]} \
--sourceToScan ${value["sourceToScan"]} \
--resultSource ${value["resultSource"]}

END
