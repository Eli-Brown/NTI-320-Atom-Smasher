#/bin/bash





#cacti-server.sh
gcloud compute instances create cacti-s \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/cacti-server.sh \
--private-network-ip=10.128.0.25
	
#rsyslog-server
gcloud compute instances create rsyslog-server \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/rsyslog-logserv-server.sh \
--private-network-ip=10.128.0.10

	
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
		
#LDAP Server
gcloud compute instances create ldap \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/ldap.sh \
--private-network-ip=10.128.0.14
	

	
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

gcloud compute instances create ubuntu-c-1 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/ubuntu-c-1.sh \
--private-network-ip=10.128.0.82


gcloud compute instances create ubuntu-c-2 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/ubuntu-c-1.sh\
--private-network-ip=10.128.0.83

#nfs server
gcloud compute instances create nfs-s \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/nfs-server.sh\
--private-network-ip=10.128.0.18

#nagios
gcloud compute instances create nagios \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/NTI-320-Atom-Smasher/final-2020/nagios-install.sh \
--private-network-ip=10.128.0.30
	

echo "Thank You Nicole :-)"
