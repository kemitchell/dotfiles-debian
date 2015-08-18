# https://blog.dbrgn.ch/2012/1/19/dwm-config-volume-battery-notification-unread-e-mail-count-more/
export EDITOR=vim
export BROWSER=google-chrome

setxkbmap -option ctrl:nocaps

while true
do
	sh $HOME/.bin/xsetroot.sh
	BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
	STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
	if ([ $BATT -le 5 ] && [ $STATUS == 'Discharging' ]); then
		# Beep
		echo -e "\007" >/dev/tty10 && sleep 0.2
		echo -e "\007" >/dev/tty10 && sleep 0.2
		echo -e "\007" >/dev/tty10 && sleep 0.2
		# Blink
		echo 'on' > /proc/acpi/ibm/light && sleep 1
		echo 'off' > /proc/acpi/ibm/light
	fi

	# Update every 10s
	sleep 10s
done &

exec $HOME/local/bin/dwm
