#!/bin/bash


# Start the SKF Python API
cd /test 
export PYTHONPATH=.:$PYTHONPATH
coverage run --source=tests tests/test_app.py
coverage xml -o output.xml
ls
cp output.xml CI/static/output.xml
cp output.xml CI/static/log_file.txt
rm -f output.xml
rm -f log_file.txt
ls CI
echo "TODO send the output files to API of a threadfix or something"

./Docker/build.sh
