# Anchore client

The Anchore CLI provides a command line interface on top of the Anchore Engine REST API.
Using the Anchore CLI users can manage and inspect images, policies, subscriptions and registries.
For further details on use of the Anchore CLI with the Anchore Engine please refer to the [Anchore engine WIKI](https://github.com/anchore/anchore-engine/wiki)


### This folder contains the Anchore client that communicates to the Anchore engine instance.

The Anchore engine can be downloaded from here: [Anchore engine](https://github.com/anchore/anchore-engine)
After following the installation guideline from the Anchore github page, the engine is ready
to communicate with the CLient.

#### Usage:
The Anchore client has quite a lot of params to get up and running, this is due to the fact
we need to authenticate against the engine, and to the registry we want to scan the containers
from.

Tool usage example:
```bash
sudo docker   \
-e ANCHOR_USER=admin
-e ANCHOR_PASS=foobar
-e ANCHOR_URL=http://localhost/:8228/v1
-e REGISTRY_USER=test
-e REGISTRY_PASS=test
-e REGISTRY_URL=https://docker.company.io
-e IMAGES= docker.io/library/debian:latest
-e JIRA_USER=http://jenkinsapi/push?token=abc123
-e JIRA_PASS=yettocome
-e JIRA_URL=yettocome
```
