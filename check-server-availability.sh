#!/bin/sh (shebang)

# echo "Would you like to check an IP or a domain? (Enter IP or domain)"

# READ CHOICE

# if [[ CHOICE==="domain" ]]; then
# 	echo "Please enter the domain name"
# elif [[ CHOICE==="IP" ]]; then
# 	echo "Please enter the IP address"
# fi

echo "Please enter the domain name"
read TARGET
echo -e "\nChecking....\n"

# -I to show document info only and not fetch the page details
# Add the -f option to curl if server errors like HTTP 404 should fail too
if curl -I -f "https://$TARGET" > /dev/null; then
  echo -e "\n$TARGET is active\n"
else
  echo -e "\n$TARGET is down\n"
fi