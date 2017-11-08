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

ls -lart


#normally npm install and use the "retire" command in src to scan is sufficient
#here below is artifactory with NPM packages we need to authenticate to so we can install and check em

export TNT_ARTIFACTORY_USER=$artUser
export TNT_ARTIFACTORY_EMAIL=$artEmail
export TNT_ARTIFACTORY_PASSWORD_HASH=$artPassHash

echo "@tntdigital:registry=https://tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:_password=${artPassHash}
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:username=${artUser}
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:email=${artEmail}
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:always-auth=true" > ~/.npmrc

npm config set @tnt-digital:registry https://tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/

#end costumer specific stuff here

cd $sourceToScan
ls -lart
npm install

retire > results.txt

echo "---------------------------------------------------retire is done---------------------------------------------------"

echo "ik ben de results cat swa!"
echo "ik ben de results cat swa!"
echo "ik ben de results cat swa!"
echo "ik ben de results cat swa!"

cat results.txt

echo "ik ben de results cat swa!"
echo "ik ben de results cat swa!"
echo "ik ben de results cat swa!"
echo "ik ben de results cat swa!"

#curl --insecure -H 'Accept: application/json' -X POST --form "file=@./dependency-check-report.xml"

: <<'END'
Tool usage example:

sudo docker run retire  \
--sourceRepo https://github.com/riiecco/dockertools.git \
--projectFolder testable-code \
--sourceToScan testable-code/pythonflask \
--resultSource https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={7M8Uw9RLqkobJJe1rcIHElOSGbTuAAuUHHNpgmMVP58}

END
