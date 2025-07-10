#!/bin/bash
# This script runs when you click the Share button!

readarray -t lines < <(gh codespace ports --codespace=${CODESPACE_NAME})
for i in "${lines[@]}"
do
    read -ra entries <<<"$i"
    code=$(curl -s -o /dev/null -w "%{http_code}" ${entries[-1]})
    if [[ ${code} -lt 400 ]] ; then
        echo "📣 Share your website preview by copying this URL: ${entries[-1]}"
        break
    fi
done
