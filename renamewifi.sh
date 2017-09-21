#!/bin/bash
wifi=$(basename /sys/class/net/w*)
sudo sed -i -- "s/\bwlp[^ ]*/$wifi/g" /etc/wicd/manager-settings.conf
