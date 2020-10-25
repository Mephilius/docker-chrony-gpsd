#!/bin/bash

#Start GPSD
if [ -c "/dev/ttyACM0" ]
then
  echo "USB device /dev/ttyACM0 exists"
  /usr/sbin/gpsd /dev/ttyACM0
else
   echo "USB device /dev/ttyACM0 not exists"
   exit 1
fi

#Start Chrony
/usr/sbin/chronyd -d
