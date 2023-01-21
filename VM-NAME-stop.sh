#!/bin/bash

nvidia-smi -i 0 -pm 1 &
sleep 1

#/usr/local/sbin/rc.tweaks set_governor ondemand &
bash -c 'for ((i=6;i<12;i++)); do cpufreq-set -c $i -g powersave; done'
bash -c 'for ((i=18;i<24;i++)); do cpufreq-set -c $i -g powersave; done'
sleep 1

exit 0;
