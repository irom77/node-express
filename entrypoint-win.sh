#!/bin/bash
# remove line endings
#$ sed 's/^M$//' entrypoint-win.sh > entrypoint.sh
if [ $# -eq 0 ]; then
    #start simple http server
    http-server
    #[path] defaults to ./public if the folder exists, and ./ otherwise.
    #Now you can visit http://localhost:8080 to view your server
elif [ $1 -eq start ]; then
    npm start
elif [ $1 -eq test ]; then
    npm test
else
    node $1
fi