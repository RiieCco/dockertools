#!/bin/bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done


python api-scan-auth-header.py --zap_key $zap_key --zap_proxy $zap_proxy --target $target --swagger $swagger --auth_token $auth_token

#curl --insecure -H 'Accept: application/json' -X POST --form "file=@./dependency-check-report.xml"

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
