#!/bin/bash

FQDN=$1
TODAY=$(date "+%Y%m%d")

PREVALIDDAY=$(echo | openssl s_client -connect $FQDN:443 -servername $FQDN 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
expr \( `date -d"$PREVALIDDAY" +%s` - `date -d"$TODAY" +%s` \) / 86400
