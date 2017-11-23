Download owasp ZAP from here:
https://github.com/zaproxy/zaproxy/wiki/Downloads

After installation owasp ZAP can be run headless in the commandline like:
https://github.com/zaproxy/zap-core-help/wiki/HelpCmdline

#first time to save session state (makes the app get smarter
./zap.sh -daemon -host <host> -port <port> -newsession <path> -config api.key=testingandwrestling -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall


#seccond time -newsession became -session and point it to the path
./zap.sh -daemon -host <host> -port <port> -session <path> -config api.key=testingandwrestling -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addoninstallall


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
