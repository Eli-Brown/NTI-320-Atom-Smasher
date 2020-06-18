#!/bin/bash

yum -y install nagios              #Install, start and enable nagios
systemctl enable nagios
systemctl start nagios

yum install -y nagios-plugins nrpe nagios-plugins-load nagios-plugins-ping nagios-plugins-disk nagios-plugins-http nagios-plugins-procs wget yum -y install nagios-plugins-all
# BUG:https://osric.com/chris/accidental-developer/2016/12/missing-nagios-plugins-in-centos-7/ (nrpe plugins have been packaged seperately and don't install with nagios-plugins-all)
# BUG #2 https://cloudwafer.com/blog/installing-nagios-agent-npre-on-centos/ (the nrpe config is commented out and checks are not defined)
# Use sed statments to uncomment NRPE config and add the appropiate flags
# add in command[check_mem]=/usr/lib64/nagios/plugins/check-mem.sh
# Install custom mem monitor
wget -O /usr/lib64/nagios/plugins/check_mem.sh https://raw.githubusercontent.com/nic-instruction/hello-nti-320/master/check_mem.sh
chmod +x /usr/lib64/nagios/plugins/check_mem.sh
systemctl enable nrpe
systemctl start nrpe
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1, 10.142.0.26/g' /etc/nagios/nrpe.cfg
# sed -i "s,command[check_hda1]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1,command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1,g" /etc/nagios/nrpe.cfg
echo "command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/disk" >> /etc/nagios/nrpe.cfg
 
#sed -i "s,command[check_hda1], command[check_disk],g" /etc/nagios/nrpe.cfg
echo "command[check_mem]=/usr/lib64/nagios/plugins/check_mem -w 80 -c 90" >> /etc/nagios/nrpe.cfg   #removed for resubmit

systemctl restart nrpe

setenforce 0                       # Turn off SElinux, so it doesn't trip us up
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config  # Disable it perminately

systemctl enable httpd             # Enable and start apache
systemctl start httpd

yum -y install nrpe                # Install, enable, and start nrpe, the nagios client
systemctl enable nrpe
systemctl start nrpe
yum -y install nagios-plugins-all
yum -y install nagios-plugins-nrpe

htpasswd -b /etc/nagios/passwd nagiosadmin nagiosadmin      # set the nagios admin password
sed -i 's,allowed_hosts=127.0.0.1,allowed_hosts=127.0.0.1\,10.128.0.3\/20,g' /etc/nagios/nrpe.cfg
# the above enables connections from your subnet, please ajust to be your subnet!

sed -i 's,dont_blame_nrpe=0,dont_blame_nrpe=1,g' /etc/nagios/nrpe.cfg
# enable NRPE monitoring

mkdir /etc/nagios/servers
# create a directory for our server configuration and enable it in the config file
sed -i 's,#cfg_dir=/etc/nagios/servers,cfg_dir=/etc/nagios/servers,g' /etc/nagios/nagios.cfg
echo 'define command{
                                command_name check_nrpe
                                command_line /usr/lib64/nagios/plugins/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
                                }' >> /etc/nagios/objects/commands.cfg

systemctl restart nagios

yum -y install wget
cd /etc/nagios
wget https://raw.githubusercontent.com/nic-instruction/hello-nti-320/master/generate_config.sh



# Now take a break, and spin up a machine called example-a with all the nrpe plugins installed and a propperly configured path
# to nagios
# put it's ip address and hostname insto generate_config.sh


#Further configuration:
#https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/monitoring-publicservices.html (Links to an external site.)


#verify
#/usr/sbin/nagios -v /etc/nagios/nagios.cfg
