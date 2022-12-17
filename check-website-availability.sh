#!/bin/sh (shebang)

# This script will check if a domain name is active or down

echo "Please enter the domain name"
read TARGET
echo -e "\nChecking....\n"
# -I to show document info only and not fetch the page details
# The -f option in curl to check server errors like HTTP 404 should fail too
if curl -I -f "https://$TARGET" > /dev/null; then
  echo -e "\n$TARGET is active\n"
else
  echo -e "\n$TARGET is down\n"
fi