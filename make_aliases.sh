#!/bin/bash

# this script is used to temporarily make aliases for a particular interface
# so that this machine can then host multiple DeviceServer's 

# the following variables can be set from the command line arguments

if_name="wlp2s0"
network_id_prefix="192.168.0."
no_of_aliases=2
starting_octet=120

# the following is a simple loop, which goes through
# starting octet and counts till no of aliases
# for each ip then constructed, a new interface is added

last_octet=$(( starting_octet+no_of_aliases-1 ))

for (( i=0; i<$no_of_aliases; i++ ))
do
	last_octet=$(( starting_octet+i ))
	ip_address=$network_id_prefix$last_octet
	ifconfig $if_name:$i $ip_address up
done
