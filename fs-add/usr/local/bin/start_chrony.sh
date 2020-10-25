#!/bin/bash

#Start GPSD
if [ -b "/dev/ttyACM0" ]
then
  echo "USB device /dev/ttyACM0 exists"
  /usr/sbin/gpsd /dev/ttyACM0
else
   echo "USB device /dev/ttyACM0 not exists"
   exit 1
fi

#Start Chrony
/usr/sbin/chrony -d
