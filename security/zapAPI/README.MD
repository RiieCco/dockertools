# OWASP ZAP client

The OWASP Zed Attack Proxy (ZAP) is one of the world’s most popular free security tools and is actively maintained by hundreds of international volunteers*. It can help you automatically find security vulnerabilities in your web applications while you are developing and testing your applications. Its also a great tool for experienced pentesters to use for manual security testing.

### This folder contains the owasp ZAP client that communicates to the ZAP instance.

The OWASP ZAP instance can be downloaded from here: [OWASP ZAP](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
After installation owasp ZAP can be run headless in the commandline like:
[OWASP Headless instructions](https://github.com/zaproxy/zap-core-help/wiki/HelpCmdline)


#Pull the ZAP headless docker
```bash
sudo docker pull owasp/zap2docker-stable
```

#Run the ZAP headless docker 
```bash
sudo docker run -u zap -p 8081:8081 -i owasp/zap2docker-stable zap.sh -daemon -host 0.0.0.0 -port 8081 -config api.key=testing -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall
```

#Run the ZAP headless and allocate more memory 
# Xmx is the max amount you want to allocate (in MB) and the Xms is the initial amount.
```bash
sudo docker run -u zap -p 8081:8081 -i owasp/zap2docker-stable java -Xmx1024M -Xms1024M -jar zap-2.7.0.jar -daemon -host 0.0.0.0 -port 8081 -config api.key=testing -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall
```

#Build the ZAP API docker:
```bash
sudo docker build -t zapapi security/zapAPI
```

#Run the ZAP API docker:
```bash
docker run -e ZAP_KEY=testing -e ZAP_PROXY=192.168.2.23:8081 -e TARGET=http://192.168.2.23:8000 -e ENDPOINTS=https://raw.githubusercontent.com/RiieCco/jenkinsfile/master/endpoints.txt -e AUTH_TOKEN=nonethistime zapapi
```
