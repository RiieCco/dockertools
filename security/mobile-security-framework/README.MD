# Mobile security framework (static only)

Mobile Security Framework (MobSF) is an automated, all-in-one mobile application (Android/iOS/Windows) pen-testing framework capable of performing static, dynamic and malware analysis. It can be used for effective and fast security analysis of Android, iOS and Windows mobile applications and support both binaries (APK, IPA & APPX ) and zipped source code.

### This is how to set up the mobsf engine on the tools server

```
   docker pull opensecurity/mobile-security-framework-mobsf
   docker run -it -p 8000:8000 opensecurity/mobile-security-framework-mobsf:latest
```

#### Usage

Build the container and run it from CI pipe-line! :-)
For the scan to work we need to supply the following params to the docker container

1. The location where to pull the apk file
2. The ip adress of the engine -> http://localhost:8000
3. The API key provided by the engine on start-up

Tool usage example:
```bash
sudo docker build -t mobsf-client .
sudo docker run -e SOURCCE_REPO=<repo> -e ENGINE_IP=<ip> -e API_KEY=api-key mobsf-client
```
