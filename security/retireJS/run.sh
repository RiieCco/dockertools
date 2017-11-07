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

export TNT_ARTIFACTORY_USER=$artUser
export TNT_ARTIFACTORY_EMAIL=$artEmail
export TNT_ARTIFACTORY_PASSWORD_HASH=$artPass


#klant specifiek

echo "@tntdigital:registry=https://tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:_password=${artPassHash}
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:username=${artUser}
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:email=${artEmail}
//tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/:always-auth=true" > ~/.npmrc

cat ~/.npmrc

npm config set registry https://tntdigital.artifactoryonline.com/tntdigital/api/npm/npm-local/

cd fedex-tnt/tools
./npm-install.sh

cd $projectFolder
ls -lart
npm install

cd $sourceToScan
ls -lart
npm install
#klant specifiek

retire
echo "retire is done"

nsp check --output summary
echo "nsp is done"

echo "/////////////////////////////////"
echo "/////////////////////////////////"
npm install @tnt-digital
echo "/////////////////////////////////"
echo "/////////////////////////////////"

#klant specifiek
npm start
echo "start the application"
echo "start the application"
echo "start the application"
echo "start the application"
npm run
echo "run available options"
echo "run available options"
echo "run available options"
echo "run available options"
npm run test
echo "check dependencies"
echo "check dependencies"
echo "check dependencies"
echo "check dependencies"
echo "check dependencies"
#klant specifiek

#curl --insecure -H 'Accept: application/json' -X POST --form "file=@./dependency-check-report.xml"

: <<'END'
Tool usage example:

sudo docker run retire  \
--sourceRepo https://github.com/riiecco/dockertools.git \
--projectFolder testable-code \
--sourceToScan testable-code/pythonflask \
--resultSource https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={7M8Uw9RLqkobJJe1rcIHElOSGbTuAAuUHHNpgmMVP58}

END
