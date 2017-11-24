# OWASP ZAP client
[logo]: https://www.owasp.org/images/1/11/Zap128x128.png "OWASP ZAP"

### This folder contains the Anchore client that communicates to the Anchore engine instance.

The Anchore engine can be downloaded from here: [Anchore engine](https://github.com/anchore/anchore-engine)
After following the installation guideline from the Anchore github page, the engine is ready
to communicate with the CLient.


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
