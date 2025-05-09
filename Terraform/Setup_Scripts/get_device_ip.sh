#!/bin/bash
# requires:
#sudo apt install bind9-dnsutils
#sudo apt  install jq
# This script fetches the public IPv4 address of the machine and formats it as a JSON object.
set -e
# Fetch public IPv4 address
INTERNETIP="$(dig +short myip.opendns.com @resolver1.opendns.com -4)"

# Ensure we have a valid IP
if [[ -z "$INTERNETIP" ]]; then
  echo "Error: Unable to retrieve IP address"
  exit 1
fi

# Correct JSON formatting
echo "{\"ip\": \"$INTERNETIP\"}"
