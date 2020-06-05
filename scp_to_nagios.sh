#!/bin/bash
bash generate_config.sh $1 $2
gcloud compute scp --zone us-central1-a $1.cfg nicolebade@nagios:/etc/nagios/servers
# Note: I had to add user nicolebade to group nagios using usermod -a -G nagios nicolebade
# I also had to chmod 777 /etc/nagios/servers
gcloud compute ssh --zone us-central1-a nicolebade@nagios --command='sudo /usr/sbin/nagios -v /etc/nagios/nagios.cfg'
