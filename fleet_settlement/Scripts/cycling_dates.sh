#!/bin/bash
input_start=2015-01-01
input_end=2017-09-30

startdate=$(date -d "$input_start") || exit -1
enddate=$(date -d "$input_end")     || exit -1

d="$startdate"
while [ "$d" != "$enddate" ]; do 
  echo $d
  d=$(date -d "$d + 1 month")
done