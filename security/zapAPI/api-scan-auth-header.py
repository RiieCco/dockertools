#!/usr/bin/env python

import time
import argparse
from pprint import pprint
from zapv2 import ZAPv2

parser = argparse.ArgumentParser()

parser.add_argument('--zap_key',  action='store', dest='zapkey', help='Provide the ZAP api key - [trrpvf26kvicie9jq83ig8hghd]')
parser.add_argument('--zap_proxy', action='store', dest='proxy', help='Provide ZAP proxy ip / port - [http://127.0.0.1:8082]')
parser.add_argument('--target',  action='store', dest='target', help='Provide the target to scan - [http://example.com]')
parser.add_argument('--swagger', action='store', dest='swagger', help='Provide swagger file - [http://example.com/api/swagger.json]' )
parser.add_argument('--auth_token', action='store', dest='token', help='Authorization token' )

results = parser.parse_args()

target = results.target
apikey = results.zapkey # Change to match the API key set in ZAP, or use None if the API key is disabled

# By default ZAP API client will connect to port 8080
zap = ZAPv2(apikey=apikey)

# Use the line below if ZAP is not listening on port 8080, for example, if listening on port 8090
zap = ZAPv2(apikey=apikey, proxies={'http': results.proxy, 'https': results.proxy})

# do stuff
print 'Accessing target %s' % target
# try have a unique enough session...

zap.urlopen(target)
# Give the sites tree a chance to get updated
time.sleep(2)

session = zap.httpSessions.set_session_token_value(results.target, "token", results.token, apikey)
print 'sesion token was added %s' % session

rule = zap.replacer.add_rule("Authorization header", "true", "REQ_HEADER", "true", "Authorization", results.token, "", apikey)
print 'rule was added %s' % rule

 
override = target.split('://')

swagger = zap.openapi.import_url(results.swagger, hostoverride=override[1], apikey=apikey)
print 'swagger file was imported %s' % swagger


scanid = zap.ascan.scan(target)
while (int(zap.ascan.status(scanid)) < 100):
    print 'Scan progress %: ' + zap.ascan.status(scanid)
    time.sleep(5)

print 'Scan completed'

# Report the results

print 'Hosts: ' + ', '.join(zap.core.hosts)
print 'Alerts: '
pprint (zap.core.alerts())

report = zap.core.xmlreport(apikey)

file = open('zap-report.xml', 'w')
file.write(report)
file.close()

zap.replacer.remove_rule("Authorization header", apikey)
