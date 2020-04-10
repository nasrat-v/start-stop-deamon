#!/bin/bash

DELAY_SEC=550
SMTP_SERVER="smtps://smtp.gmail.com:465"
MAIL_SENDER_ADDRS="$1"
MAIL_SENDER_PSSWD="$2"
FILE_UPLD="$3"
MAIL_RECEIVERS=("$4" "$5" "$6")

send_email()
{
    for email_receiver in "${MAIL_RECEIVERS[@]}"
    do
	:
	curl --url $SMTP_SERVER --ssl-reqd --mail-from $MAIL_SENDER_ADDRS --mail-rcpt $email_receiver --upload-file $FILE_UPLD --user $MAIL_SENDER_ADDRS:$MAIL_SENDER_PSSWD
    done
}

run_bot()
{
    while true; do
	send_email
	sleep $DELAY_SEC
    done
}

#
# Main
#

echo "Start send_email"
run_bot
echo "End send_email"
