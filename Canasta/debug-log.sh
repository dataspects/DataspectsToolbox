#!/bin/bash
COMMAND='cd .. ; mkdir logs ; cd logs ; touch debug.log; chmod 777 debug.log ; tail -f debug.log'
#COMMAND='cd .. ; mkdir logs ; cd logs ; touch debug.log; chmod 777 debug.log ; tail -f debug.log | grep "###"'
echo $COMMAND
sudo docker exec -it mwstakeorgdevclone_web_1 bash -c "$COMMAND"
