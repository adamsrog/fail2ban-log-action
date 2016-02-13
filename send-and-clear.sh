#!/bin/bash

# This is a cronjob meant to be run each day at midnight:
# 0 0 * * * /etc/fail2ban/logs/send-and-clear.sh >/dev/null 2>&1
#
# Sends the specified address the ban list and generates a summary
# based on the specified jails. Appends the all-bans log and then
# clears the current ban list.

# CONFIG
BANLOG=/var/log/fail2ban-bans.log
ALLBANLOG=/var/log/fail2ban-bans-all.log
SENDTO=you@you.com
SENDFROM=your@server.com
JAILS=(
	"dovecot"
	"exim"
	"exim-spam"
	"pure-ftpd"
	"ssh-ddos"
	"ssh-iptables"
	)

# Generate a summary and append to log file
echo -e "\n`uname -n` Summary for `date +%m-%d-%Y`\n-----------------------" >> $BANLOG
for JAIL in ${JAILS[@]}; do
	echo -e "$JAIL\t`cat $BANLOG | grep $JAIL | wc -l`" >> $BANLOG
done

# Send ban log
logger "[fail2ban] Emailing current ban list to $SENDTO"
cat $BANLOG | mail -s "`uname -n` IP Bans for `date +%m-%d-%Y`" -r $SENDFROM $SENDTO

# Move data to main log
logger "[fail2ban] Merging log to $ALLBANLOG"
cat $BANLOG >> $ALLBANLOG

# Clear current ban list
logger "[fail2ban] Clearing $BANLOG"
echo -e "`uname -n` IP Bans for `date +%m-%d-%Y`\n------------------" > $BANLOG