#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Source Ansible/GCP credentials
# usage: source ./ansible_gcp_creds.sh

# Constants - CHANGE ME!
export GCP_PROJECT='banded-hexagon-163902'
export GCP_AUTH_KIND='serviceaccount'
export GCP_SERVICE_ACCOUNT_FILE='/home/elibrown_scc/ansible/banded-hexagon-163902-e09b1feb4f08.json'
export GCP_SCOPES='https://www.googleapis.com/auth/compute'
