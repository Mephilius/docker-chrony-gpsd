#!/bin/bash

#Start Chrony
echo "starting chronyd"
/usr/sbin/chronyd

#Start GPSD
echo "starting gpsd"
if [ -c "/dev/ttyACM0" ]
then
  echo "USB device /dev/ttyACM0 exists"
  /usr/sbin/gpsd /dev/ttyACM0
else
   echo "USB device /dev/ttyACM0 not exists"
   exit 1
fi

echo "wait endless..."
# Wait endless
tail -f /dev/null
