#!/bin/bash
# install snmp and tools

# start by installing the repos for mariadb 10 (required by cacti)
for file in $( ls /etc/yum.repos.d/ ); do mv /etc/yum.repos.d/$file /etc/yum.repos.d/$file.bak; done

# start by installing the repos for mariadb 10 (required by cacti)
echo "[nti-310-epel]
name=NTI310 EPEL
baseurl=http://104.197.59.12/epel
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/local-repo.repo
echo "[nti-310-base]
name=NTI310 BASE
baseurl=http://104.197.59.12/base
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/local-repo.repo
echo "[nti-310-extras]
name=NTI310 EXTRAS
baseurl=http://104.197.59.12/extras/
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/local-repo.repo
echo "[nti-310-updates]
name=NTI310 UPDATES
baseurl=http://104.197.59.12/updates/
gpgcheck=0
enabled=1" >> /etc/yum.repos.d/local-repo.repo
####
yum -y install net-snmp net-snmp-utils httpd


# create a new snmpd.conf
mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.orig
touch /etc/snmp/snmpd.conf


# edit snmpd.conf file /etc/snmp/snmpd.conf
echo '# create myuser in mygroup authenticating with 'public' community string and source network 10.128.0.0/24
com2sec myUser	10.128.0.0/24 public
# myUser is added into the group 'myGroup' and the permission of the group is defined
group    myGroup    v1        myUser
group    myGroup    v2c        myUser
view all included .1
access myGroup    ""    any    noauth     exact    all    all    none' >> /etc/snmp/snmpd.conf

systemctl enable httpd
systemctl start httpd


# Enable snmp, Start snmp
systemctl enable snmpd
systemctl start snmpd

