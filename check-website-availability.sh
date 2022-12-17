#!/bin/sh (shebang)

# This script will check if a domain name is up or down

TARGET=''


until [[  -n $TARGET ]]
do
	echo "Please enter the domain"
	read TARGET
	if [[ $TARGET != '' ]]; then
		echo -e "\nChecking....\n"
		
		# -I to show document info only and not fetch the page details
		# The -f option in curl to check server errors like HTTP 404 should fail too
		# /dev/null will prevent curl from printing the result on screen
		if curl -I -f "https://$TARGET" > /dev/null; then
		  echo -e "\n$TARGET is up\n"
		else
		  echo -e "\n$TARGET is down\n"
		fi
	fi
done
