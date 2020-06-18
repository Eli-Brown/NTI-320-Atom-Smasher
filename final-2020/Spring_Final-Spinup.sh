#/bin/bash

#build
gcloud compute instances create build \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/build-environment.sh \
--private-network-ip=10.128.0.4

#example
gcloud compute instances create example \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/example.sh \
--private-network-ip=10.128.0.3
	
sleep 20s
	

#example
gcloud compute instances create example \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/example.sh \
--private-network-ip=10.128.0.3
	
sleep 20s
	
#repo
gcloud compute instances create repo \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/build/rpm-build/add-repo.sh \
--private-network-ip=10.128.0.11

#nrpe
gcloud compute instances create nrpe \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/nagios/nrpe-install.sh \
--private-network-ip=10.128.0.28


#cacti-server.sh
gcloud compute instances create cacti-s \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/cacti-server.sh \
--private-network-ip=10.128.0.25


#cacti-client.sh
gcloud compute instances create cacti-c \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/cacti-client.sh \
--private-network-ip=10.128.0.24

	
#rsyslog-server
gcloud compute instances create rsyslog-server \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/rsyslog-logserv-server.sh \
--private-network-ip=10.128.0.10

sleep 30s
	
#postgres server
gcloud compute instances create postgres \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/postgres.sh \
--private-network-ip=10.128.0.12
	
sleep 20s
	
#LDAP Server
gcloud compute instances create ldap \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/ldap.sh
 \
--private-network-ip=10.128.0.14
	
sleep 20s
	
#Django
gcloud compute instances create django \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/django.sh\
--private-network-ip=10.128.0.16

sleep 20s
	

gcloud compute instances create ubuntu-c-1 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/ubuntu-c-1 \
--private-network-ip=10.128.0.82

sleep 30

gcloud compute instances create ubuntu-c-2 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/ubuntu-c-2.sh\
--private-network-ip=10.128.0.83

sleep 30
	
#nfs server
gcloud compute instances create nfs-s \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/nfs-server.sh\
--private-network-ip=10.128.0.18

#nfs client
gcloud compute instances create nfs-c \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/nsf_client.sh \
--private-network-ip=10.128.0.19
	
#nagios
gcloud compute instances create nagios \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/nagios/nagios-install.sh \
--private-network-ip=10.128.0.30
	
sleep 20
echo "Thank You Nicole :-)"

