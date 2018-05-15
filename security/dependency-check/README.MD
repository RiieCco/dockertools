# OWASP Dependency check

Dependency-Check is a utility that identifies project dependencies and checks if there are any known, publicly disclosed, vulnerabilities. Currently Java and .NET are supported; additional experimental support has been added for Ruby, Node.js, Python, and limited support for C/C++ build systems

### This folder contains the owasp ZAP client that communicates to the ZAP instance.

The OWASP Dependency check can be downloaded from here: [OWASP Dependenct check](https://www.owasp.org/index.php/OWASP_Dependency_Check)

#### Usage

Build the container and run it from CI pipe-line! :-)
For the scan to work we need to supply the following params to the docker container

1. The code source we want to scan for dependencies

Tool usage example:
```bash
sudo docker run -e SOURCCE_REPO=<repo>  DOJO_URL=http://192.168.2.23 -e DOJO_API_KEY=admin:746d89602a29e1897d6342faf00f63d28334fb9e -e DOJO_ENGAGEMENT_ID=1 dep-check
```
