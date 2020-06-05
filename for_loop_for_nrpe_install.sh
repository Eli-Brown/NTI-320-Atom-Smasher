for servername in $( gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios );  do 
    gcloud compute ssh --zone us-central1-a nicolebade@$servername --command='sudo yum -y install wget && sudo wget https://raw.githubusercontent.com/nic-instruction/NTI-320/master/nagios/nrpe_install.sh && sudo bash nrpe_install.sh'
done
