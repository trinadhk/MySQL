#!/bin/bash

# variables used for returning the status of the scripts
success=0
error=1
warning=2

retVal=$success

log_path="/etc/preScriptdocker.log"   #path of log file
printf  "Hi \n" > $log_path

docker pause 4e3d480c1be2
status=$?
printf  "Freeze status: $status\n" >> $log_path
if [ $status -eq 0 ]; then
echo "Container is paused"
printf  "Container is paused\n" >> $log_path
retval=$success
else
echo "ERROR IN SYSTEM FREEZE"
printf  "ERROR IN SYSTEM FREEZE\n" >> $log_path
retVal=$error
docker unpause 4e3d480c1be2
fi

exit $retVal
