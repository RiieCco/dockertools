# OWASP ZAP client

The OWASP Zed Attack Proxy (ZAP) is one of the world’s most popular free security tools and is actively maintained by hundreds of international volunteers*. It can help you automatically find security vulnerabilities in your web applications while you are developing and testing your applications. Its also a great tool for experienced pentesters to use for manual security testing.

### Dynamic ZAP instances with narrow scoping for short feedback in CI/CD pipelines

This docker folder contains the docker folder of the official zap stable release
however the zap-baseline.py was edited for my own scans. This helps to run more scans
for more developers at the same time with their own zap instance so the devs get
effective feedback of only their commits.

#for running scans against monolythical apps and scope them

#Step 1
```
go to the docker folder, do a build like
docker build -t zapscan .
```

#Step2
```
After building the container push it to an docker hub and you can run it from CI pipeline
```

#Step3 how to run the scan
```
docker run zapscan zap-baseline.py --target http://192.168.2.23 --endpoints https://raw.githubusercontent.com/RiieCco/jenkinsfile/master/endpoints.txt
```

the --endpoints gets a text file from a repository that is used to let the spider iterate over. The
spider is set to "spider subtree only" so it just collects GET and POST options from the imported 
URLS so the scan can be scoped very carfully for a short feedback loop.

There wil also be other optional params like --header --cookie if these are set it wil
take care of setting the headers or cookies requred for authentication, you could set
the CI up that it first curls the app and gives the token/cookie back to the build of
the ZAP tool to authenticate.

```
sh 'TOKEN="$(curl -X POST --header "Content-Type: application/json" --header "Accept: application/json" -d \'{ "username": "admin", "password": "test-skf" }\' "http://demo.securityknowledgeframework.org:8888/api/user/login" | cut -d \'"\' -f 4)"'
```
