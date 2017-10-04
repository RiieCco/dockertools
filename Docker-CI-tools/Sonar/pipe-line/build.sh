#!/bin/bash

if [ -d test ]; then rm -rf test; fi
git clone https://github.com/riiecco/test.git
cd /test

pip3 install -r requirements.txt
pip3 install nose

#export python path otherwise the unit test fails
export PYTHONPATH=.:$PYTHONPATH
nosetests --with-xunit /test/tests/test_app.py 

coverage erase
coverage run --branch --source=./CI tests/test_app.py 
coverage xml -i

#run the dependcy check file
./../dependency-check/bin/dependency-check.sh --project pythonscript  --format "XML" --out . --scan CI/**


#start running the basic sonar scanning process
./../sonar-scanner-3.0.3.778-linux/bin/sonar-scanner -X -Dsonar.host.url=http://172.17.0.1:9000 \
-Dsonar.projectKey=my:project \
-Dsonar.projectName="Code quality python" \
-Dsonar.projectVersion=1 \
-Dsonar.projectBaseDir=. \
-Dsonar.sources=./CI \
-Dsonar.python.xunit.reportPath=/nosetests.xml \
-Dsonar.python.xunit.skipDetails=true \
-Dsonar.python.coverage.reportPath=/coverage.xml \
-Dsonar.dependencyCheck.reportPath=dependency-check-report.xml


