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

ls - lart

: <<'END'
#klant specifiek
cd fedex-tnt/tools
./npm-install.sh

cd ../

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

#klant specifiek
npm start
npm run
npm run e2e
#klant specifiek

#curl --insecure -H 'Accept: application/json' -X POST --form "file=@./dependency-check-report.xml"


Tool usage example:

sudo docker run retire  \
--sourceRepo https://github.com/riiecco/dockertools.git \
--projectFolder testable-code \
--sourceToScan testable-code/pythonflask \
--resultSource https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={7M8Uw9RLqkobJJe1rcIHElOSGbTuAAuUHHNpgmMVP58}

END
