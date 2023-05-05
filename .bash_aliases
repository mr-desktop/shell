alias tm='cd ~/projects/teamup_all'

alias tms='clear && tm'
alias tmb='clear && tm'

alias tmu='clear && tm && teamup-up-force'
alias tmd='clear && tm && teamup-down'


print_manual() {
  YELLOW="\e[93m"
  ENDCOLOR="\e[0m"

  echo -e "⇒ ${YELLOW}$1${ENDCOLOR}
$2"
}

set_time_value() {
  local result=$1
  local file=$2
  local index=$3
  local length=$4
  local string_size=${#file}

  if [ "$string_size" -gt "$index" ]
  then
    eval "$result=${file:index:length}"
  else
    eval "$result=00"
  fi
}

set_photos_name_from_date_taken() {
  exiftool "-DateTimeOriginal>FileName" -d 'I_%Y%m%d_%H%M%S.jpg' -w %f.%e *.* --ext sh
}

set_photos_date_taken_from_name() {
  local format=$1
  for file in "."/*.jpg
  do
    # 19991231235959 - Dec 31 1999 - 23:59:59
    if [ "$format" = "Ymd" ]
    then
      year=${file:2:4}
      month=${file:6:2}
      day=${file:8:2}
    # 991231235959 - Dec 31 1999 - 23:59:59
    elif [ "$format" = "ymd" ]
    then
      year=${file:2:2}
      month=${file:5:2}
      day=${file:8:2}
    # 123199235959 - Dec 31 1999 - 23:59:59
    elif [ "$format" = "mdy" ] 
    then
      month=${file:2:2}
      day=${file:5:2}
      year=${file:8:2}
    # 311299235959 - Dec 31 1999 - 23:59:59
    elif [ "$format" = "dmy" ] 
    then
      day=${file:2:2}
      month=${file:5:2}
      year=${file:8:2}
    fi
  done

  if [[ ${seconds#0} -gt 59 ]]
  then
    seconds=$(( seconds - 59 ))
    if [[ $seconds -lt 10 ]]
    then
      seconds="0$seconds"
    fi
  fi

  if [[ $format == *"Y"* ]]; then
    set_time_value hours file 8 2
    set_time_value minutes file 10 2
    set_time_value seconds file 12 2
  else
    set_time_value hours file 6 2
    set_time_value minutes file 8 2
    set_time_value seconds file 10 2
  fi


  echo "$year $month $day - $hours $minutes $seconds"
  exiftool "-AllDates=$year:$month:$day $hours:$minutes:$seconds" "$file"
  echo "Renaming pictures"
  exiftool "-DateTimeOriginal>FileName" -d 'I_%Y%m%d_%H%M%S.jpg' -w %f.%e *.* --ext sh
}

secuence_to_video() {
  ffmpeg -framerate 30 -i %04d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p secuence.mp4
}

pdf_to_jpg() {
  convert -density 300 *.pdf -quality 90 pdfjpg-coverted.jpg
}

pdf_to_png() {
  convert -density 300 *.pdf -quality 90 pdfjpg-coverted.png
}

clear_permissions() {
  sudo chmod a+rw -R ./
}

clean_system_files () {
  files=(".DS_Store" ".AppleDouble" ".LSOverride" ".DocumentRevisions-V100" ".fseventsd" ".Spotlight-V100" ".TemporaryItems" ".Trashes" ".VolumeIcon.icns" ".com.apple.timemachine.donotpresent" ".AppleDB" ".AppleDesktop" "Thumbs.db" "ehthumbs.db" "ehthumbs_vista.db" "desktop.ini")

  for f in ${files[@]}; do
    rm -r -f -v **/${f}
  done
}