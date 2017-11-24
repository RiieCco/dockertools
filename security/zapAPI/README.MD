# OWASP ZAP client

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
  sudo docker run zap_api  \
  --zap_key abc123 \
  --zap_proxy http://172.18.0.1:1234 \
  --target https://demo.securityknowledgeframework.org \
  --swagger https://demo.securityknowledgeframework.org/api/swagger.json \
  --auth_token eydfsgDFGHdgbdfjfhghj.dsgjkdg@234tdw57dsg.3590dsfl*45532dfs \
  --dasboard willbecomemyJIRAapilink
```
