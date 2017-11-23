Download owasp ZAP from here:
https://github.com/zaproxy/zaproxy/wiki/Downloads

After installation owasp ZAP can be run headless in the commandline like:
https://github.com/zaproxy/zap-core-help/wiki/HelpCmdline

#first time to save session state (makes the app get smarter
./zap.sh -daemon -host <host> -port <port> -newsession <path> -addoninstallall


#seccond time -newsession became -session and point it to the path
./zap.sh -daemon -host <host> -port <port> -session <path> -addoninstallall


