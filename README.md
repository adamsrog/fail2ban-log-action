## Fail2Ban Log Action
Getting an email each time a ban occurs was annoying, so this is a custom
solution for receiving a nightly email that provides a full ban list and a
summary of the bans for each jail.

Default ban log file is `/var/log/fail2ban-bans.log`.
Default all ban log file is `/var/log/fail2ban-bans-all.log`.

## Installation
* Move `log.conf` to `/etc/fail2ban/actions.d/`.
* Move `send-and-clear.sh` to `/etc/fail2ban/`.
	* Setup a cron job to run each night at midnight: `crontab -e`
		*  0 0 * * * /etc/fail2ban/send-and-clear.sh >/dev/null 2>&1
	* Configure email address the summary is sent to and from.
	* Configure jails to monitor (use `service fail2ban status` to see active jails)
* Edit the `jail.local` file to use the log action.
	* action = log[name=%(__name__)s]

## Sample Email
```
yourserver.com IP Bans for 02-12-2016
------------------
pure-ftpd       120.27.163.186         http://whatismyipaddress.com/ip/120.27.163.186 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=120.27.163.186
ssh-iptables    12.203.51.250    http://whatismyipaddress.com/ip/12.203.51.250 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=12.203.51.250
ssh-ddos        111.93.142.33    http://whatismyipaddress.com/ip/111.93.142.33 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=111.93.142.33
pure-ftpd       120.76.72.219    http://whatismyipaddress.com/ip/120.76.72.219 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=120.76.72.219
ssh-iptables    159.122.254.140  http://whatismyipaddress.com/ip/159.122.254.140 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=159.122.254.140
ssh-ddos        195.154.52.9     http://whatismyipaddress.com/ip/195.154.52.9 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=195.154.52.9
pure-ftpd       121.40.190.189   http://whatismyipaddress.com/ip/121.40.190.189 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=121.40.190.189
ssh-iptables    185.112.102.165  http://whatismyipaddress.com/ip/185.112.102.165 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=185.112.102.165
pure-ftpd       139.196.37.142   http://whatismyipaddress.com/ip/139.196.37.142 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=139.196.37.142
ssh-iptables    185.130.5.179    http://whatismyipaddress.com/ip/185.130.5.179 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=185.130.5.179
pure-ftpd       178.32.41.85     http://whatismyipaddress.com/ip/178.32.41.85 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=178.32.41.85
ssh-iptables    185.130.5.200    http://whatismyipaddress.com/ip/185.130.5.200 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=185.130.5.200
pure-ftpd       47.88.7.39       http://whatismyipaddress.com/ip/47.88.7.39 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=47.88.7.39
ssh-iptables    188.132.221.4    http://whatismyipaddress.com/ip/188.132.221.4 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=188.132.221.4
ssh-iptables    192.131.44.55    http://whatismyipaddress.com/ip/192.131.44.55 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=192.131.44.55
ssh-iptables    195.14.0.128     http://whatismyipaddress.com/ip/195.14.0.128 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=195.14.0.128
ssh-iptables    202.164.39.21    http://whatismyipaddress.com/ip/202.164.39.21 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=202.164.39.21
ssh-iptables    212.129.26.190   http://whatismyipaddress.com/ip/212.129.26.190 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=212.129.26.190
ssh-iptables    212.159.61.123   http://whatismyipaddress.com/ip/212.159.61.123 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=212.159.61.123
ssh-iptables    66.162.88.202         http://whatismyipaddress.com/ip/66.162.88.202 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=66.162.88.202
ssh-iptables    80.191.202.2     http://whatismyipaddress.com/ip/80.191.202.2 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=80.191.202.2
ssh-iptables    95.159.143.240   http://whatismyipaddress.com/ip/95.159.143.240 or http://www.ip-tracker.org/locator/ip-lookup.php?ip=95.159.143.240



yourserver.com Summary for 02-12-2016
-----------------------
dovecot 0
exim    0
exim-spam       0
pure-ftpd       6
ssh-ddos        2
ssh-iptables    14
```