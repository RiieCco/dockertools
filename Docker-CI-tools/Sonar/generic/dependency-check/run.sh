#!/bin/bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

echo $sourcerepo
echo $folder

#if [ -d $folder ]; then rm -rf $folder; fi
#git clone $sourcerepo


#./../dependency-check/bin/dependency-check.sh --project $folder  --format "XML" --out . $scan $source/**

#git clone $resultrepo

#git add .
#git commit -m "From dependency-check"
#git push  https://$username:$password@github.com/RiiecCo/results.git --all