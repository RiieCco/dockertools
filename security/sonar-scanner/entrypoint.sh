#!/bin/bash

set -e

exit_env_error() {
    echo "Error: env var '${1}' not set" >&2
    exit 1
}

PROJECT_FOLDER="${PROJECT_FOLDER:-/project}"
OUTPUT_FOLDER="${OUTPUT_FOLDER:-/project}"



mkdir -p "${OUTPUT_FOLDER}"


sonar-scanner -Dsonar.host.url=http://172.16.245.94:9000 \
  -Dsonar.projectKey=aaa \
  -Dsonar.projectName="aaa" \
  -Dsonar.projectVersion=1 \
  -Dsonar.projectBaseDir=/ \
  -Dsonar.sources=/ \
  -Dsonar.dotnet.visualstudio.solution.file=foobar.sln \
  -Dsonar.dotnet.excludeGeneratedCode=true \
  -Dsonar.dotnet.4.0.sdk.directory=C:/Windows/Microsoft.NET/Framework/v4.0.30319 \
  -Dsonar.dotnet.version=4.5.2 \
  -Dsonar.password=<pass>
