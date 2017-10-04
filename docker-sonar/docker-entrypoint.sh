#!/bin/bash
set -e

echo "##"
echo "# Preparing to starting SonarQube"
echo "# - removing all bundled plugins"
rm -rf /opt/sonarqube/lib/bundled-plugins/sonar-*.jar

echo "# - copy downloaded plugins to: ${SONARQUBE_HOME}/extensions/plugins/"
cp -a $PLUGIN_DOWNLOAD_LOCATION/. $SONARQUBE_HOME/extensions/plugins/

echo "# - list installed plugins"
ls -la ${SONARQUBE_HOME}/extensions/plugins/

echo "# - starting SonarQube"
echo "##"
$SONARQUBE_HOME/bin/run.sh