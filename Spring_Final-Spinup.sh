#!/bin/bash
	
#rsyslog-server
gcloud compute instances create rsyslog-server \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/spinup-rsyslog-server.sh \
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
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/postgres-centos.sh \
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
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/LDAP-automation-final.sh \
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
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/django-postgres.sh \
--private-network-ip=10.128.0.16

sleep 20s
	
#nfs server
gcloud compute instances create nfs-s \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/ldap-nfs-server.sh \
--private-network-ip=10.128.0.18

#nfs client
gcloud compute instances create nfs-c \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/ldap-nfs-client-final.sh \
--private-network-ip=10.128.0.19
	
sleep 60s
	
#Ubuntu-1
gcloud compute instances create ubuntu-1 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/ubuntu-1.sh \
--private-network-ip=10.128.0.20

#ubuntu-2
gcloud compute instances create ubuntu-2 \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-central1-a \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=/home/elibrown_scc/Hello-NTI-310-2020/final/config/ubuntu-2.sh \
--private-network-ip=10.128.0.21
