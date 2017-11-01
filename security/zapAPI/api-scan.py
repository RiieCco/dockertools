#!/usr/bin/env python

import time
import argparse
from pprint import pprint
from zapv2 import ZAPv2

parser = argparse.ArgumentParser()

parser.add_argument('--zap_key',  action='store', dest='zapkey', help='provide the owasp zap api key - e.g: [trrpvf26kvicie9jq83ig8hghd]')
parser.add_argument('--zap_proxy', action='store', dest='proxy', help='specify zap procy ip and port - e.g: [http://127.0.0.1:8082]')
parser.add_argument('--target',  action='store', dest='target', help='specify the target to scan - e.g:[http://example.com]')
parser.add_argument('--swagger', action='store', dest='swagger', help='specify the url where the swagger file lives - e.g: [http://example.com/api/swagger.json]' )

results = parser.parse_args()

target = results.target
apikey = results.zapkey # Change to match the API key set in ZAP, or use None if the API key is disabled

# By default ZAP API client will connect to port 8080
zap = ZAPv2(apikey=apikey)
# Use the line below if ZAP is not listening on port 8080, for example, if listening on port 8090
zap = ZAPv2(apikey=apikey, proxies={'http': 'http://127.0.0.1:8082', 'https': 'http://127.0.0.1:8082'})

# do stuff
print 'Accessing target %s' % target
# try have a unique enough session...

zap.urlopen(target)
# Give the sites tree a chance to get updated
time.sleep(2)

zap.replacer.add_rule("Authorization header", "true", "REQ_HEADER", "true", "Authorization", results.authorization, "", apikey)
zap.openapi.import_url('https://localhost/api/swagger.json', hostoverride='localhost', apikey=apikey)

print 'Scanning target %s' % target
scanid = zap.ascan.scan(target)
while (int(zap.ascan.status(scanid)) < 100):
    print 'Scan progress %: ' + zap.ascan.status(scanid)
    time.sleep(5)

print 'Scan completed'

# Report the results

print 'Hosts: ' + ', '.join(zap.core.hosts)
print 'Alerts: '
pprint (zap.core.alerts())

zap.core.xmlreport(apikey)
