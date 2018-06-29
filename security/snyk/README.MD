# RetireJS

There is a plethora of JavaScript libraries for use on the web and in node.js apps out there. This greatly simplifies, but we need to stay update on security fixes. "Using Components with Known Vulnerabilities" is now a part of the OWASP Top 10 and insecure libraries can pose a huge risk for your webapp. The goal of Retire.js is to help you detect use of version with known vulnerabilities.

More information about RetireJS can be found here: [RetireJS](https://retirejs.github.io/retire.js/)

### This folder contains the guide to use the RetireJS container.

Where to trigger the NPM install depends per project on the location of the build.
For the scan to work we need to supply the following params to the docker container:

1. The code source we want to scan for dependencies
2. Specify the project folder of the application
3. Specify the source to scan (src, root, app) folder
4. Where to push the metrics/report to.

Tool usage example:
```bash
sudo docker run -e REPO=https://github.com/riiecco/juice-shop -e FOLDER=/juice-shop retirejs \ 
-e ARTIFACTORY_USER=dummyText \    #optional
-e ARTIFACTORY_EMAIL=dummyText \   #optional
-e ARTIFACTORY_PWHASH=dummyText \  #optional
-e JIRA_PROXY_BASEURL=dummyText \  #optional
-e JIRA_API_TOKEN=dummyText \      #optional
-e JIRA_USER=dummyText \           #optional
-e JIRA_PASSWD=dummyText \         #optional
|| true                   
```
Pipe the command to true otherwise build fuilds because of retire scan
