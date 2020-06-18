#!/bin/bash
# This should be the finishing script for a micro with a 50G hard drive

yum -y install rpm-build make gcc git                                         # install rpm tools, compiling tools and source tools
mkdir -p /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}                      # create the rpmbuild dirrectory structure 
                                                                              # (the docs say this happens by default, this is incorrect on centos 7)
cd ~/
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros                         # Set the rpmbuild path in an .rpmmacros file
cd ~/rpmbuild/SOURCES

cd ../SPECS                                                                   # head to the SPECS directory
cp /usr/share/vim/vimfiles/template.spec .                        
