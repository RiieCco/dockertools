# OWASP Dependency check

Dependency-Check is a utility that identifies project dependencies and checks if there are any known, publicly disclosed, vulnerabilities. Currently Java and .NET are supported; additional experimental support has been added for Ruby, Node.js, Python, and limited support for C/C++ build systems

### This folder contains the owasp ZAP client that communicates to the ZAP instance.

The OWASP Dependency check can be downloaded from here: [OWASP Dependenct check](https://www.owasp.org/index.php/OWASP_Dependency_Check)

#### Usage

For the scan to work we need to supply the following params to the docker container

1. The code source we want to scan for dependencies
2. Specify the project folder of the application
3. Specify the source to scan (src, root, app) folder
4. Where to push the metrics/report to.

Tool usage example:
```bash
sudo docker run -e SOURCCE_REPO=<repo> dep-check
```
