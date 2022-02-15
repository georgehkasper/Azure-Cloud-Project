#!/bin/bash
cat $1_Dealer_schedule | grep "$2 $3" | awk -F" " '{print $1, $2, $5, $6}'
