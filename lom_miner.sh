#!/bin/bash

# ------------------------------ lom: dependencias
ENDFORMAT="\e[0m"

# Colors
LIGHTGREEN=92
LIGHTYELLOW=93
LIGHTBLUE=94

declare -A USUARIOS=(
  [1]="kolombo"
  [2]="bruno"
  [3]="koturno"
)

TITULO() {
  echo -e ""
  echo -e "\033[0;${LIGHTGREEN}m$(date +'%H:%M:%S')${ENDFORMAT} \033[0;${LIGHTYELLOW}m---------------------------------- $1${ENDFORMAT}"
}


echo_c() {
  echo -e "\033[0;${1}m${2}${ENDFORMAT}"
}

MINERO() {
  TITULO "Minero"

  XX=(
    100
    250
    420
    590
    750
    930
  )

  YY=(
    950
    1140
    1300
    1480
    1630
    1800
    1970
  )

  for t in {1..40}
  do
    echo_c $LIGHTBLUE "round: $t"
    for j in "${YY[@]}"
    do
      for i in "${XX[@]}"
      do
        adb shell input tap $i $j
      done
    done
    adb shell input tap 520 2100
    adb shell input tap 520 2100
  done
}

RECIBIR() {
  clear
  MINERO
}

RECIBIR