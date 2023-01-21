#!/bin/bash

nvidia-smi -i 0 -pm 0
sleep 1

#/usr/local/sbin/rc.tweaks set_governor ondemand &
bash -c 'for ((i=6;i<12;i++)); do cpufreq-set -c $i -g ondemand; done'
bash -c 'for ((i=18;i<24;i++)); do cpufreq-set -c $i -g ondemand; done'
sleep 1

exit 0;
