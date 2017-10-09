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

ls

./../dependency-check/bin/dependency-check.sh --project $projectFolder  --format "XML" --out . --scan $sourceToScan/**

if [ -d $resultFolder ]; then rm -rf $resultFolder; fi
git clone $resultRepo


cp dependency-check-report.xml $resultFolder

cd $resultFolder

#git config --global user.email "you@example.com"
#git config --global user.name "Your Name"
git init
git add -A
git commit -m "From dependency-check"
git push https://$username:$password@github.com/RiiecCo/results.git 

: <<'END'
Tool usage example:

sudo docker run dep  \
--sourceRepo https://github.com/RiieCco/dockertools.git \
--projectFolder dockertools/testable-code \
--sourceToScan dockertools/testable-code/pythonflask \
--resultRepo http://github.com/riiecco/results.git \
--resultFolder results \
--username Riiecco \
--password Lakers112

END
