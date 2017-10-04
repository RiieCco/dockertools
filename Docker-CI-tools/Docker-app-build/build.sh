#!/bin/bash


# Try to build the application
cd /test 
export FLASK_APP=app.py
export PYTHONPATH=/test
export FLASK_DEBUG=0
python3.6 CI/app.py 



