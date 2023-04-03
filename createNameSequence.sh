#!/bin/bash
counter=0

for file in "."/*.png
do
  prefix=""
  counter=$(( $counter + 1 ))
  
  if [[ ${counter#0} -lt 10 ]]
  then
    prefix+="0"
  fi

  if [[ ${counter#0} -lt 100 ]]
  then
    prefix+="0"
  fi

  if [[ ${counter#0} -lt 1000 ]]
  then
    prefix+="0"
  fi

  if [[ ${counter#0} -lt 10000 ]]
  then
    prefix+="0"
  fi

  mv $file "./S_$prefix$counter.png"
done