#!/bin/bash

wget 'https://gist.githubusercontent.com/domroutley/5e26e2d13000f4003ba6fddb13e23d0c/raw/e8b5c142136745c180fe9b800f14c61a2bc3e634/server.py'
mv server.py $HOME/server.py
python3 $HOME/server.py 8080 # TODO, turn this into a service
