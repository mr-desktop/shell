for file in "."/*.jpg
do
  # 19991231235959 - Dec 31 1999 - 23:59:59
  # 19940000_500_06
  
  year=${file:2:4}
  month=${file:6:2}
  day=${file:8:2}

  if [[ ${day#0} -lt 1 ]]
  then
    day="01"
  fi

  if [[ ${month#0} -lt 1 ]]
  then
    month="01"
  fi

  group=${file:11:2}
  id=${file:15:2}
  
  group=$(( group - 40 ))

  echo "-----$file"
  echo "$year:$month:$day 01:$group:$id"

  exiftool "-AllDates=$year:$month:$day 01:$group:$id" "$file"
  # exiftool "-DateTimeOriginal>FileName" -d "exp/I_%Y%m%d_%H%M%S.%%e" -w %f.%e *.* --ext sh

  mv "$file" "I_${year}${month}${day}_01${group}${id}.jpg"
done
