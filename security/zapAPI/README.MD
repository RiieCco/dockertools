# OWASP ZAP client

The OWASP Zed Attack Proxy (ZAP) is one of the world’s most popular free security tools and is actively maintained by hundreds of international volunteers*. It can help you automatically find security vulnerabilities in your web applications while you are developing and testing your applications. Its also a great tool for experienced pentesters to use for manual security testing.

### This folder contains the owasp ZAP client that communicates to the ZAP instance.

The OWASP ZAP instance can be downloaded from here: [OWASP ZAP](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
After installation owasp ZAP can be run headless in the commandline like:
[OWASP Headless instructions](https://github.com/zaproxy/zap-core-help/wiki/HelpCmdline)


#first time to save session state (makes the app get smarter)
```bash
./zap.sh -daemon -host <host> -port <port> -newsession <path> -config api.key=testingandwrestling -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall
```

#seccond time -newsession became -session and point it to the path
```bash
./zap.sh -daemon -host <host> -port <port> -session <path> -config api.key=testingandwrestling -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall
```

#Run it with no session option to run with clean state
```bash
./zap.sh -daemon -host <host> -port <port> -config api.key=testingandwrestling -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall
```

Tool usage example:
```bash
  sudo docker run \
  -e ZAP_KEY=testing \
  -e ZAP_PROXY=0.0.0.0 \
  -e TARGET=http://172.17.0.1 \
  -e SWAGGER=nonethistime\
  -e AUTH_TOKEN=nonethistime \ 
  zapAPI
```
