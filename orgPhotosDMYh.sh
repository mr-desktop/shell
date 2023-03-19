#!/bin/bash

for file in "."/*.jpg
do
  day=${file:2:2}
  month=${file:5:2}
  year=${file:8:2}
  hours=${file:14:2}
  minutes=${file:17:2}

  exiftool "-DateTimeOriginal=20$year:$month:$day $hours:$minutes:00" "$file"
done

echo "Renaming pictures"
exiftool "-DateTimeOriginal>FileName" -d 'I_%Y%m%d_%H%M%S.jpg' -w %f.%e *.* --ext sh