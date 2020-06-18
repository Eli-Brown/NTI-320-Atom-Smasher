#!/bin/bash
yum install -y nagios-plugins nrpe nagios-plugins-load nagios-plugins-ping nagios-plugins-disk nagios-plugins-http nagios-plugins-procs wget yum -y install nagios-plugins-all
#!/bin/bash
# This should be the finishing script for a micro with a 50G hard drive

yum -y install rpm-build make gcc git                                         # install rpm tools, compiling tools and source tools
mkdir -p /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}                      # create the rpmbuild dirrectory structure 
                                                                              # (the docs say this happens by default, this is incorrect on centos 7)
cd ~/
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros                         # Set the rpmbuild path in an .rpmmacros file
cd ~/rpmbuild/SOURCES
git clone https://github.com/NagiosEnterprises/nrpe.git                       # Get the nrpe source from github
git clone https://github.com/NagiosEnterprises/nagioscore.git                 # Get the nagios source from github

tar -czvf nrpe-3.1.tar.gz /root/rpmbuild/SOURCES/nrpe                         # Tar up the source (needed to create an RPM)
tar -czvf nagioscore-4.3.1.tar.gz /root/rpmbuild/SOURCES/nagioscore           # Tar up the source (needed to create an RPM)

mv nagioscore nagioscore-4.3.1                                                # Clean up our source dir by making a dirrectory
mv nrpe nrpe-3.1                                                              # structure that will allow us to have multiple
mkdir nagioscore                                                              # versions of our source code
mkdir nrpe
mv nagioscore-4.3.1 nagioscore
mv nrpe-3.1 nrpe

cd ../SPECS                                                                   # head to the SPECS directory
cp /usr/share/vim/vimfiles/template.spec .                         

# BUG:https://osric.com/chris/accidental-developer/2016/12/missing-nagios-plugins-in-centos-7/ (nrpe plugins have been packaged seperately and don't install with nagios-plugins-all)
# BUG #2 https://cloudwafer.com/blog/installing-nagios-agent-npre-on-centos/ (the nrpe config is commented out and checks are not defined)
# Use sed statments to uncomment NRPE config and add the appropiate flags
# add in command[check_mem]=/usr/lib64/nagios/plugins/check-mem.sh
# Install custom mem monitor
wget -O /usr/lib64/nagios/plugins/check_mem.sh https://raw.githubusercontent.com/nic-instruction/hello-nti-320/master/check_mem.sh
chmod +x /usr/lib64/nagios/plugins/check_mem.sh
systemctl enable nrpe
systemctl start nrpe
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1, 10.126.0.28/g' /etc/nagios/nrpe.cfg
# sed -i "s,command[check_hda1]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1,command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1,g" /etc/nagios/nrpe.cfg
echo "command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/disk" >> /etc/nagios/nrpe.cfg
 
#sed -i "s,command[check_hda1], command[check_disk],g" /etc/nagios/nrpe.cfg
echo "command[check_mem]=/usr/lib64/nagios/plugins/check_mem -w 80 -c 90" >> /etc/nagios/nrpe.cfg   #removed for resubmit

systemctl restart nrpe

# Troubleshooting
# From nagios server: /usr/lib64/nagios/plugins/check_nrpe -H 10.0.0.28 -c check_load From NRPE server execute the command in libexec /usr/lib64/nagios/plugins/
