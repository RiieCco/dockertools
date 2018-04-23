curl https://raw.githubusercontent.com/RiieCco/dockertools/master/security/diva.apk > diva.apk
echo "curl"
export HASH="$(curl -F 'file=@/var/jenkins_home/workspace/test/diva.apk' http://192.168.2.23:8000/api/v1/upload -H "Authorization:39f6fd6d1c6ef13a1b81445ebcdc6f135c5d15ac7b6c0c8507a19f89a1988765" | grep "hash" | cut -d: -f2 | cut -d \" -f2)"
echo "export"
echo $HASH
curl -X POST --url http://192.168.2.23:8000/api/v1/scan --data "scan_type=apk&file_name=diva.apk&hash=${HASH}" -H "Authorization:39f6fd6d1c6ef13a1b81445ebcdc6f135c5d15ac7b6c0c8507a19f89a1988765"
echo "post1"
curl -X POST --url http://192.168.2.23:8000/api/v1/report_json --data "hash=$HASH&scan_type=apk" -H "Authorization:39f6fd6d1c6ef13a1b81445ebcdc6f135c5d15ac7b6c0c8507a19f89a1988765" > result.json
echo "post2"
curl -X POST --url http://192.168.2.23:8000/api/v1/download_pdf --data "hash=$HASH&scan_type=apk" -H "Authorization:39f6fd6d1c6ef13a1b81445ebcdc6f135c5d15ac7b6c0c8507a19f89a1988765" > result.pdf
echo "post3"
cat result.json
unset HASH
