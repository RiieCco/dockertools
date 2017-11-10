#!/bin/bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

if [ -d $projectFolder ]; then rm -rf $projectFolder; fi
git clone $sourceRepo

cd $projectFolder
docker-compose run --rm --publish 9000:9000 app sbt it:test-only *UserApiRoutesIntegrationSpec

cd ~/
python api-scan-auth-header.py --zap_key $zap_key --zap_proxy $zap_proxy --target $target --swagger $swagger --auth_token $auth_token

ls -lart


#curl --insecure -H 'Accept: application/json' -X POST --form "file=@./zap-report.xml" https://10.203.189.152:8443/threadfix/rest/applications/1/upload?apiKey={Q58iYwVfKbk1YVBsp5TJQgudCenPYjMNEE4MasM9B7nY}

: <<'END'
Tool usage example:

sudo docker run zapAPI  \
--zap_key ASD235457rgfSfds
--zap_proxy http://127.0.0.1:8080
--target https://example.com
--swagger https://example.com/api/swagger.api
--auth_token eydfsgDFGHdgbdfjfhghj.dsgjkdg@234tdw57dsg.3590dsfl*45532dfs
--dasboard https://threadfix.com/foobarsdasdas
END
