#!/bin/bash
printf '%5s\n' $(ping -c1 -W1 $1 | awk -F'=' '/time/{print $4}')
