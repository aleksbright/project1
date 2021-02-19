#!/bin/bash
crontab -l > current_cron
sed '/---script managed section---/q' current_cron > new_cron
cat >> new_cron << EOF
# updated cron jobs here
* * * * * make all /home/project1/
EOF
crontab < new_cron
rm -f new_cron current_cron

