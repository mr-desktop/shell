#!/bin/bash

for file in "."/*.jpg
do
  year=${file:2:4}
  month=${file:6:2}
  day=${file:8:2}
  hours=${file:10:2}
  minutes=${file:12:2}
  seconds=${file:14:2}
  count=${file:16:2}

  if [[ ${seconds#0} -gt 59 ]]
  then
    seconds=$(( $seconds - 59 ))
    if [[ $seconds -lt 10 ]]
    then
      seconds="0$seconds"
    fi
  fi

  echo "$year $month $day - $hours $minutes $seconds - $count"
  exiftool "-AllDates=$year:$month:$day $hours:$minutes:$seconds" "$file"
done

echo "Renaming pictures"
exiftool "-DateTimeOriginal>FileName" -d 'I_%Y%m%d_%H%M%S.jpg' -w %f.%e *.* --ext sh