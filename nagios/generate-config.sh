#!/bin/bash

if [[  $# -eq 0 ]]; then                    # If no arguments are given to the script
   echo "Usage:"                            # then print a usage statement and exit
   echo "generate_config.sh hostname ip
   "
   exit 0;
fi

host="$1"
ip="$2"

echo "
# Host Definition
define host {
    use         linux-server        ; Inherit default values from a template
    host_name   $host               ; The name we're giving to this host
    alias       $host server        ; A longer name associated with the host
    address     $ip                 ; IP address of the host
}
# Service Definition
define service{
        use                             generic-service         ; Name of service template to
        host_name                       $host
        service_description             load
        check_command                   check_nrpe!check_load
}
define service{
        use                             generic-service         ; Name of service template to
        host_name                       $host
        service_description             users
        check_command                   check_nrpe!check_users
}
define service{
        use                             generic-service         ; Name of service template to
        host_name                       $host
        service_description             disk
        check_command                   check_nrpe!check_disk
}
define service{
        use                             generic-service         ; Name of service template to
        host_name                       $host
        service_description             totalprocs
        check_command                   check_nrpe!check_total_procs
}
define service{
        use                             generic-service         ; Name of service template to
        host_name                       $host
        service_description             memory
        check_command                   check_nrpe!check_mem
}
"> /etc/nagios/servers/"$host".cfg
