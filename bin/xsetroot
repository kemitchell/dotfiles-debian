DATETIME=`date --iso-8601=minutes | sed 's!T! !' | sed 's!-0700!!'`
BATTERYSTATE=`battery-summary`
xsetroot -name "${BATTERYSTATE} | ${DATETIME}"
