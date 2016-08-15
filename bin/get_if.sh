#!/bin/bash
echo $(for i in /sys/class/net/*; do if [ "$(cat $i/operstate)" == "up" ]; then echo $i; fi; done) | cut -d'/' -f5 | head -n1
