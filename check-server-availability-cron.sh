#!/bin/sh (shebang)

# This script will check if a server is up or down

# Run this script like and also pass the IP address as a parameter $ check-server-availability-cron.sh 171.181.201.81

TARGET=$1

if [[ $TARGET != '' && $TARGET =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then

	# -I to show document info only and not fetch the page details
	# The -f option in curl to check server errors like HTTP 404 should fail too
	# /dev/null will prevent curl from printing the result on screen
	if ping -c1 -W1 $TARGET > /dev/null; then
		echo -e "\n$TARGET is up\n"
	else
		# we can also write to a log file
		echo -e "\n$TARGET is down\n"
	fi
else 
	# we can also write to a log file
	echo -e '\nWrong or empty input\n'
fi