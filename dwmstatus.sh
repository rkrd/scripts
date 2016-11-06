#!/bin/sh

while :
    do
        BATT=$(apm | awk '/Battery/{bat=$4} /adapter/{pow = $4 == "connected" ? "CHRG" : "BATT"} END{print pow " " bat}')
        MAILCOUNT="Mail: $(ls -1 ~/Mail/{INBOX}/new/* |wc -l)"
        TIME="$(date +'%Y-%m-%d %H:%M')"
        xsetroot -name "$MAILCOUNT | $TIME | $BATT"
        sleep 60
    done 
