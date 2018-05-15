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

#How to run the scan normally
```
docker run -v $(pwd):/zap/wrk/:rw zapscan zap-scoped-scan.py -t http://192.168.2.23 -e https://raw.githubusercontent.com/RiieCco/jenkinsfile/master/endpoints.txt 
```

#How to run the scan with auth headers for JWT i.e.
```
docker run -v $(pwd):/zap/wrk/:rw zapscan zap-scoped-scan.py -t http://192.168.2.23 -e https://raw.githubusercontent.com/RiieCco/jenkinsfile/master/endpoints.txt -z "-config replacer.full_list=asdasda -config replacer.description=sadas -config replacer.enabled=true -config replacer.matchtype=REQ_HEADER -config replacer.replacement=foobar"
```

-t   (for target)
-e   (defines the endpoints to be scanned)
-z   (Custom config options such as adding auth headers)

#How to run the scan full for nightly builds
```
docker run -v $(pwd):/zap/wrk/:rw zapscan zap-full-scan.py -t http://192.168.2.23 
```

#How to run the scan full for API scans, can feed swagger to scope
```
Usage: docker run zapscan zap-api-scan.py -t <target> -f <format> [options]

    -t target         target API definition, currently only an OpenAPI URL, eg https://www.example.com/openapi.json
    -f format         either openapi or soap
Options:
    -c config_file    config file to use to INFO, IGNORE or FAIL warnings
    -u config_url     URL of config file to use to INFO, IGNORE or FAIL warnings
    -g gen_file       generate default config file (all rules set to WARN)
    -r report_html    file to write the full ZAP HTML report
    -w report_md      file to write the full ZAP Wiki (Markdown) report
    -x report_xml     file to write the full ZAP XML report
    -a                include the alpha passive scan rules as well
    -d                show debug messages
    -P                specify listen port
    -D                delay in seconds to wait for passive scanning 
    -i                default rules not in the config file to INFO
    -l level          minimum level to show: PASS, IGNORE, INFO, WARN or FAIL, use with -s to hide example URLs
    -n context_file   context file which will be loaded prior to scanning the target
    -p progress_file  progress file which specifies issues that are being addressed
    -s                short output format - dont show PASSes or example URLs
    -z zap_options    ZAP command line options e.g. -z "-config aaa=bbb -config ccc=ddd"
```


#how to curl to get auth token in jenkins file
```
sh 'TOKEN="$(curl -X POST --header "Content-Type: application/json" --header "Accept: application/json" -d \'{ "username": "admin", "password": "test-skf" }\' "http://demo.securityknowledgeframework.org:8888/api/user/login" | cut -d \'"\' -f 4)"'
```


#some stuff for defect dojo curls + additions for the setup.bash from the "django-DefectDojo" git 

```
curl --request POST --url http://localhost:8000/api/v1/importscan/ --header 'authorization: ApiKey admin:23f51b27bda98cb538bfa56627a4ab768792a636' --header 'cache-control: no-cache' --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' --form minimum_severity=Info --form scan_date=2018-05-01 --form verified=False --form file=@/var/jenkins_home/workspace/pipe-line/results.xml --form tags=TEST --form active=True --form engagement=/api/v1/engagements/1/ --form 'scan_type=ZAP Scan'
```


You need to add those 3 lines and than build your own container!

```

sed -i "s/TEMPLATE_DEBUG = DEBUG/TEMPLATE_DEBUG = False/g" dojo/settings/settings.py
sed -i "s/ALLOWED_HOSTS = \[]/ALLOWED_HOSTS = ['192.168.2.23']/g" dojo/settings/settings.py
cat dojo/settings/settings.py


```