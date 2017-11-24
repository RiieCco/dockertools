# Anchore client

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
sudo docker run anchore  \
--anchor_user admin
--anchor_pass foobar
--anchor_url http://localhost/:8228/v1
--registry_user test
--registry_pass test
--registry_url https://docker.company.io
--images  docker.company.io/image:foo, docker.company.io/image:bar, etc
--resultSource http://jenkinsapi/push?token=abc123
```
