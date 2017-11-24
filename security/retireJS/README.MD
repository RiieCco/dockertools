# RetireJS

There is a plethora of JavaScript libraries for use on the web and in node.js apps out there. This greatly simplifies, but we need to stay update on security fixes. "Using Components with Known Vulnerabilities" is now a part of the OWASP Top 10 and insecure libraries can pose a huge risk for your webapp. The goal of Retire.js is to help you detect use of version with known vulnerabilities.

More information about RetireJS can be found here: [RetireJS](https://retirejs.github.io/retire.js/)

### This folder contains the guide to use the RetireJS container.

The RetireJS is installable as an NPM package into the docker container itself that is done
with the following simple command:

```bash
RUN npm install -g retire
```

#### Usage:

The *run.sh* file might need some tinkering depending on the customer, some customers also have
their own artifactory that might need to add the following code:

```bash
export ARTIFACTORY_USER=$artUser
export ARTIFACTORY_EMAIL=$artEmail
export ARTIFACTORY_PASSWORD_HASH=$artPassHash

npm config set @artifactory:registry https://company.artifactoryonline.com/company/api/npm/npm-local/

```

Also, whenever there are no node packages that need to have dependency checking we
can simply comment out the following line of code:

```bash
npm install
```
Where to trigger the NPM install depends per project on the location of the build.

1. Pull the source we want to scan for dependencies
2. Navigate to the src || root folder of the application. 
3. Run NPM install if there are any NPM packages that need to be installed
4. Run retire to start scanning for dependencies.

For the scan to work we need to supply the following params to the docker container:
Tool usage example:
```bash
sudo docker run retire  \
--sourceRepo https://github.com/riiecco/dockertools.git \
--projectFolder testable-code \
--sourceToScan testable-code/pythonflask \
--resultSource https://172.17.0.1:8443/threadfix/rest/applications/1/upload?apiKey={AgdLRap39VUEnBUajxZjoeKKunIv7psnBeH33vFfU}

```
