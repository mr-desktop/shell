# ------------------------------ dependencias extras
ENDFORMAT="\e[0m"

# Styles
RESET=0
BOLD=1
FAINT=2
ITALIC=3

# Colors
BLACK=30
RED=31
GREEN=32
YELLOW=33
BLUE=34
MAGENTA=35
CYAN=36
LIGHTGRAY=37
GRAY=90
LIGHTRED=91
LIGHTGREEN=92
LIGHTYELLOW=93
LIGHTBLUE=94
LIGHTMAGENTA=95
LIGHTCYAN=96
WHITE=97


# ------------------------------ dependencias

COL_ICON_FIR_POS_X=80
COL_ICON_SEC_POS_X=190
ROW_ICON_FIR_POS_Y=2180

BTN_LEFT_POS_X=340
BTN_RIGHT_POS_X=711
BTN_CENTER_POS_X=520

NUEVO_PASO() {
  echo -e ""
  echo -e "\033[0;${LIGHTGREEN}m$(date +'%H:%M:%S')${ENDFORMAT} \033[0;${LIGHTYELLOW}m---------------------------------- $1${ENDFORMAT}"
}

# ------------------------------ pasos

CHAT() {
  NUEVO_PASO "Chat"

  if [[ $1 = "full" ]]; then    
    echo "abrir chat"
    adb shell input tap 50 2030
    sleep 1s
    echo "abrir modal de regalos"
    adb shell input tap 120 1810
    sleep 2.5s
  fi

  XX=(
    "190"
    "510"
    "800"
  )

  YY=(
    "640"
    "950"
    "1300"
    "1640"
  )

  for t in {1..4}
  do
    for j in "${YY[@]}"
    do
      for i in "${XX[@]}"
      do
        echo -e "\033[0;${LIGHTRED}madb shell input tap x:$i y:$j, round: $t${ENDFORMAT}"
        adb shell input tap $i $j
      done
    done
    sleep 2s
    adb shell input tap 900 400
  done

  if [[ $1 = "full" ]]; then
    echo "cerrar modal de regalos"
    adb shell input tap $BTN_CENTER_POS_X 2100
    sleep 0.5s
    echo "salir del chat"
    adb shell input tap 90 2030
    sleep 1s
  fi
}

ALMA_MARCIAL() {
  NUEVO_PASO "Alma Marcial"
  echo "abrir seccion de alma marcial"
  adb shell input tap 910 1420
  sleep 1s
  echo "navegar a la seccion de obtencion de alma marcial"
  adb shell input tap 880 1950
  sleep 1s
  echo "abrir provocacion de alma marcial"
  adb shell input tap $BTN_CENTER_POS_X 860
  sleep 1s
  echo "tomar recompensas diarias"
  adb shell input tap 900 470
  sleep 2.5s
  adb shell input tap 900 470
  sleep 1s
  echo "salir de la seccion de provocacion de alma marcial"
  adb shell input tap 890 2150
  sleep 1s
  echo "salir de la seccion de alma marcial"
  adb shell input tap $BTN_CENTER_POS_X 2100
  sleep 1s
}

RODAR_MAQUINA() {
  for i in {1..3}
  do
    echo "invocar 35 veces"
    adb shell input tap 300 1450
  done
  sleep 2s
  adb shell input tap $BTN_CENTER_POS_X 1900
}

TIENDA() {
  NUEVO_PASO "Tienda"
  echo "ir a la tienda"
  adb shell input tap 940 $ROW_ICON_FIR_POS_Y
  sleep 1s
  echo "navegar hacia arriba del menu"
  adb shell input swipe $BTN_CENTER_POS_X 820 $BTN_CENTER_POS_X 2200 100
  sleep 1s
  echo "tomar recompensas de paquete gratis"
  adb shell input tap 300 1000
  sleep 2.5s
  adb shell input tap 900 50
  sleep 1s
  echo "navegar a la seccion de roleta de habilidades"
  adb shell input tap 170 2010
  sleep 2.5s
  RODAR_MAQUINA
  echo "navegar a la seccion de roleta de companeros"
  adb shell input tap 660 450
  sleep 1s
  RODAR_MAQUINA
  echo "salir de la tienda"
  adb shell input tap 940 $ROW_ICON_FIR_POS_Y
  sleep 1s
}

OFICIANTE() {
  NUEVO_PASO "Oficiante"
  echo "abrir seccion de oficiante"
  adb shell input tap 590 750
  sleep 2s
  echo "abrir seccion de ver intimidad"
  adb shell input tap 590 900
  sleep 2s
  echo "abrir modal de conseguir lates"
  adb shell input tap 350 320
  sleep 2s
  echo "aumentar la cantidad de lates"
  adb shell input tap 750 1080
  sleep 1s
  echo "comprar lates"
  adb shell input tap $BTN_CENTER_POS_X 1250
  sleep 2s
  adb shell input tap $BTN_CENTER_POS_X 430
  sleep 2s
  echo "abrir modal de dar lates a la primera persona"
  adb shell input tap 830 750
  sleep 1s
  echo "dar lates"
  adb shell input tap $BTN_CENTER_POS_X 1470
  sleep 1s
  echo "salir de ver intimidad"
  adb shell input tap $BTN_CENTER_POS_X 1840
  sleep 1s
  echo "salir de la seccion de oficiante"
  adb shell input tap $BTN_CENTER_POS_X 1600
  sleep 1s
  adb shell input tap $BTN_CENTER_POS_X 1280
  sleep 1s
}

RESIDENCIA_SEGUIDORES() {
  NUEVO_PASO "Residencia de Seguidores"
  echo "abrir residencia de seguidores"
  adb shell input tap 870 1660
  sleep 1s
  echo "abrir el modal de recompensa"
  adb shell input tap $BTN_CENTER_POS_X 2030
  sleep 2.5s
  echo "recibir recompensa online"
  adb shell input tap $BTN_CENTER_POS_X 1730
  sleep 2.5s
  adb shell input tap $BTN_CENTER_POS_X 1730
  sleep 1s
  echo "ir a la seccion de recompensa offline"
  adb shell input tap 700 870
  sleep 2.5s
  echo "recibir recompensa offline"
  adb shell input tap $BTN_CENTER_POS_X 1730
  sleep 2.5s
  adb shell input tap $BTN_CENTER_POS_X 1730
  sleep 2s
  echo "cerrar modal de recompensa"
  adb shell input tap 900 50
  sleep 1s
  echo "salir de la residencia de seguidores"
  adb shell input tap 900 2140
  sleep 1s
}

ESTACIONAMIENTO() {
  NUEVO_PASO "Estacionamiento"
  echo "abrir estacionamiento"
  adb shell input tap 830 1200
  sleep 1s
  echo "abrir tienda"
  adb shell input tap 730 $ROW_ICON_FIR_POS_Y
  sleep 1s
  echo "navegar hacia arriba del menu"
  adb shell input swipe $BTN_CENTER_POS_X 820 $BTN_CENTER_POS_X 2200 100
  adb shell input swipe $BTN_CENTER_POS_X 820 $BTN_CENTER_POS_X 2200 100
  sleep 1s
  echo "abrir modal de comprar guia de transformacion"
  adb shell input tap 320 1280
  sleep 1s
  echo "seleccionar maximo"
  adb shell input tap 740 1110
  echo "comprar"
  adb shell input tap $BTN_CENTER_POS_X 1260
  sleep 2.5s
  adb shell input tap 900 630
  sleep 1s
  echo "navegar a tarjeta de recompensa offline"
  adb shell input swipe $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1800 2000
  sleep 1s

  YY=(
    "1840"
    "1860"
    "1890"
    "1900"
    "1920"
  )

  for t in "${YY[@]}"
  do
    echo "abrir modal de comprar tarjeta de recompensa offline"
    adb shell input tap 320 $YY
    sleep 0.5s
    echo "seleccionar maximo"
    adb shell input tap 740 1110
    # sleep 1s
    echo "comprar"
    adb shell input tap $BTN_CENTER_POS_X 1260
    sleep 0.5s
    adb shell input tap 900 630
    sleep 0.2s
  done
  echo "salir del estacionamiento"
  adb shell input tap 900 $ROW_ICON_FIR_POS_Y
  sleep 1s
}

HACIENDA() {
  NUEVO_PASO "Hacienda"
  echo "abrir hacienda"
  adb shell input tap 400 1590
  sleep 1s
  echo "colectar cosecha"
  adb shell input tap 160 2000
  sleep 7s
  adb shell input tap 160 2000
  sleep 7s
  echo "abrir modal de sembrar"
  adb shell input tap 160 2000
  sleep 1s
  echo "sembrar"
  adb shell input tap $BTN_CENTER_POS_X 1310
  sleep 2.5s
  echo "abrir tienda"
  adb shell input tap 700 $ROW_ICON_FIR_POS_Y
  sleep 1s
  echo "abrir modal de compra de abono"
  adb shell input tap 700 1250
  sleep 1s
  echo "seleccionar 5"
  adb shell input tap 730 1100
  sleep 1s
  echo "comprar"
  adb shell input tap $BTN_CENTER_POS_X 1290
  sleep 2.5s
  adb shell input tap 900 630
  sleep 1s
  echo "salir de la hacienda"
  adb shell input tap 900 $ROW_ICON_FIR_POS_Y
  sleep 1s
}

SALON() {
  NUEVO_PASO "Salon del Clan"
  echo "abrir el modal del salon"
  adb shell input tap 380 350
  sleep 1s
  echo "abrir modal de donaciones"
  adb shell input tap 630 1900
  sleep 1s
  echo "donar al clan"
  for i in {1..8}
  do
    adb shell input tap $BTN_CENTER_POS_X 1270
  done
  echo "navegar a la seccion de ayuda de clan"
  adb shell input tap 420 1910
  sleep 1s
  echo "ayudar a todos"
  adb shell input tap $BTN_CENTER_POS_X 1890
  sleep 1.5s
  adb shell input tap $BTN_CENTER_POS_X 1890
  sleep 1s
  echo "salir de la seccion de ayuda"
  adb shell input tap $BTN_CENTER_POS_X 2000
  sleep 1.5s
  echo "salir del salon"
  adb shell input tap $BTN_CENTER_POS_X 2000
  sleep 2s
}

PEZ() {
  NUEVO_PASO "Pez Enojado"
  echo "abrir modal para inscribirse en el pez enojado"
  adb shell input tap 870 1540
  sleep 2.5s
  echo "inscribirse"
  adb shell input tap $BTN_CENTER_POS_X 1640
  sleep 1s
  adb shell input tap $BTN_CENTER_POS_X 1640
  sleep 1s
  echo "salir del menu de inscripcion"
  adb shell input tap $BTN_CENTER_POS_X 1780
  sleep 1s
}

CORREO() {
  NUEVO_PASO "Correo"
  echo "abrir correo"
  adb shell input tap $COL_ICON_FIR_POS_X 765
  sleep 1s
  echo "recibir correo"
  adb shell input tap $BTN_RIGHT_POS_X 1640
  sleep 2.5s
  adb shell input tap $BTN_RIGHT_POS_X 1640
  sleep 1s
  echo "salir del correo"
  adb shell input tap $BTN_CENTER_POS_X 1810
  sleep 1s
}

RULETA() {
  NUEVO_PASO "Ruleta"
  echo "abrir ruleta"
  adb shell input tap $COL_ICON_FIR_POS_X 900
  sleep 1s
  echo "girar ruleta"
  adb shell input tap $BTN_CENTER_POS_X 1380
  sleep 8s
  adb shell input tap $BTN_CENTER_POS_X 1380
  sleep 1s
  echo "salir de la ruleta"
  adb shell input tap 50 420
  sleep 1s
}

AMIGOS() {
  NUEVO_PASO "Amigos"
  echo "entrar a la seccion de amigos"
  adb shell input tap $COL_ICON_FIR_POS_X 1070
  sleep 2.5s
  echo "dar y recibir"
  adb shell input tap $BTN_CENTER_POS_X 1540
  sleep 2.5s
  adb shell input tap $BTN_CENTER_POS_X 1540
  sleep 1s
  echo "salir de la seccion de amigos"
  adb shell input tap $BTN_CENTER_POS_X 1760
  sleep 1s
}

7_DIAS() {
  NUEVO_PASO "7 Dias de Recompensas"
  echo "abrir seccion de 7 dias de recompensas"
  adb shell input tap $COL_ICON_FIR_POS_X 1820
  sleep 1s
  echo "dia 1"
  adb shell input tap 360 750
  sleep 1s
  adb shell input tap 110 540
  echo "dia 2"
  adb shell input tap 730 780
  sleep 1s
  adb shell input tap 110 540
  echo "dia 3"
  adb shell input tap 800 1120
  sleep 1s
  adb shell input tap 110 540
  echo "dia 4"
  adb shell input tap 480 1130
  sleep 1s
  adb shell input tap 110 540
  echo "dia 5"
  adb shell input tap 170 1220
  sleep 1s
  adb shell input tap 110 540
  echo "dia 6"
  adb shell input tap 190 1520
  sleep 1s
  adb shell input tap 110 540
  echo "dia 7"
  adb shell input tap 600 1500
  sleep 1s
  adb shell input tap 110 540
  sleep 1s
  echo "salir de la seccion de 7 dias de recompensas"
  adb shell input tap $BTN_CENTER_POS_X 1760
  sleep 1s
}

RAIDE() {
  echo "hacer raide"
  for i in {1..12}
  do
    adb shell input tap $1 $2
  done
  sleep 2s
  adb shell input tap $BTN_CENTER_POS_X 1520
  sleep 1s
  for i in {1..6}
  do
    adb shell input tap $1 $2
    sleep 1s
  done
}

LAMPARA_MAGICA() {
  NUEVO_PASO "Ladron de Lampara Magica"
  echo "abrir menu de ladron de la lampara magica"
  adb shell input tap 830 1430
  sleep 1s
  RAIDE 450 1570
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

RUINAS_LLAMAS() {
  NUEVO_PASO "Ruinas de las LLamas"
  echo "abrir menu de ruinas de las llamas"
  adb shell input tap 830 1750
  sleep 1s
  RAIDE 450 1570
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

CIUDAD_ANTIGUA() {
  NUEVO_PASO "Ciudad Antigua"
  echo "abrir menu de ciudad antigua"
  adb shell input tap 830 940
  sleep 2.5s
  echo "volver a la ruina anterior"
  adb shell input tap 250 780
  sleep 1s
  RAIDE 410 1920
  sleep 1s
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 2079
  sleep 1s
  adb shell input tap $BTN_RIGHT_POS_X 1260
  sleep 1s
}

TORRE_CRONOLOGICA() {
  NUEVO_PASO "Torre Cronologica"
  echo "abrir menu de torre cronologica"
  adb shell input tap 830 1250
  sleep 1s
  echo "abrir menu de raide"
  RAIDE 450 1570
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

SANTUARIO() {
  NUEVO_PASO "Santuario de las LLamas"
  echo "abrir menu de santuario de llama ardiente"
  adb shell input tap 830 1560
  sleep 1s
  echo "abrir menu de raide"
  RAIDE 410 1620
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

PROVOCACION() {
  NUEVO_PASO "Provocacion de Oscuridad"
  echo "abrir menu de provocacion de oscuridad"
  adb shell input tap 830 1850
  sleep 2.5s
  echo "comenzar raide"
  adb shell input tap $BTN_CENTER_POS_X 1370
  sleep 2.5s
  adb shell input tap $BTN_CENTER_POS_X 1630
  sleep 1s
  adb shell input tap 150 680
  sleep 1s
  for i in {1..1}
  do
    echo "redefinir $1"
    adb shell input tap $BTN_LEFT_POS_X 1370
    sleep 1s
    adb shell input tap $BTN_RIGHT_POS_X 1260
    sleep 1s
    adb shell input tap $BTN_CENTER_POS_X 1370
    sleep 1s
    adb shell input tap $BTN_CENTER_POS_X 1630
    sleep 1s
    adb shell input tap 150 680
    sleep 2.5s
  done
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 2100
  sleep 1s
}

# CONTRA_ATAQUE() {
#   NUEVO_PASO "Contra Ataque"
#   echo "abrir seccion de contra ataque"
#   adb shell input tap $BTN_CENTER_POS_X 740
# sleep 1s
#   echo "navegar a la seccion de misiones"
#   adb shell input tap 700 2120
# sleep 1s
#   for i in {1..14}
#   do
#     echo "recibir regalo $i"
#     adb shell input tap $BTN_CENTER_POS_X 560
# sleep 1s
#   done
#   echo "cerrar seccion de contra ataque"
#   adb shell input tap 930 2150
# sleep 1s
# }

TARJETA_PRIVILEGIOS() {
  NUEVO_PASO "Tarjeta de Privilegios"
  echo "navegar a tarjeta de privilegios"
  adb shell input tap $BTN_CENTER_POS_X 1600
  sleep 1s
  echo "recibir rapido"
  adb shell input tap $BTN_CENTER_POS_X 1500
  sleep 2.5s
  adb shell input tap 180 580
  sleep 1s
}

ESCALERAS_CRECIMIENTO() {
  NUEVO_PASO "Escaleras de Crecimiento"
  echo "abrir menu de escaleras de crecimiento"
  adb shell input tap $BTN_CENTER_POS_X 670
  sleep 1s
  echo "tomar recompensa"
  adb shell input tap 770 470
  sleep 2.5s
  adb shell input tap 770 470
  sleep 1s
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

OFERTAS_DIARIAS() {
  NUEVO_PASO "Ofertas Diarias"
  echo "abrir menu de ofertas diarias"
  adb shell input tap $BTN_CENTER_POS_X 970
  sleep 1s
  echo "tomar recompensa"
  adb shell input tap 770 470
  sleep 2.5s
  adb shell input tap 770 470
  sleep 1s
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

BAUL_REEMBOLSO() {
  NUEVO_PASO "Baul de Reembolso"
  echo "abrir menu de baul reembolso"
  adb shell input tap $BTN_CENTER_POS_X 1300
  sleep 1s
  echo "tomar recompensa"
  adb shell input tap 770 520
  sleep 2.5s
  adb shell input tap 770 520
  sleep 1s
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

SUPER_TARJETA() {
  NUEVO_PASO "Super Tarjeta"
  echo "abrir menu de super tarjeta"
  adb shell input tap 500 1500
  sleep 1s
  echo "tomar recompensa"
  adb shell input tap 770 470
  sleep 2.5s
  adb shell input tap 770 470
  sleep 1s
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 1900
  sleep 1s
}

COMPARTIR() {
  NUEVO_PASO "Compartir"
  echo "abrir menu de compartir juego"
  adb shell input tap $COL_ICON_SEC_POS_X 430
  sleep 0.5s
  echo "compartir con discord"
  adb shell input tap $BTN_LEFT_POS_X 1480
  sleep 0.5s
  echo "cerrar navegador"
  adb shell am force-stop com.brave.browser
  sleep 0.5s
  echo "recibir gemas de discord"
  adb shell input tap 300 1350
  sleep 2.5s
  adb shell input tap 300 1350
  echo "cerrar modal"
  adb shell input tap $BTN_CENTER_POS_X 2140
  sleep 1s
}

MISIONES() {
  NUEVO_PASO "Misiones"
  echo "ir a la seccion de misiones"
  adb shell input tap $COL_ICON_FIR_POS_X 550
  sleep 1s

  echo "recibir regalos"
  for i in {1..3}
  do
    adb shell input tap 800 870
    adb shell input tap 800 1040
    adb shell input tap 800 1210
    adb shell input tap 800 1370
    adb shell input tap 800 1540
    adb shell input tap 800 1710
    sleep 2.5s
    adb shell input tap 175 510
  done

  echo "recibir diamantes, llaves y ticket"
  adb shell input tap 330 550
  sleep 2.5s
  adb shell input tap 170 570
  sleep 1s
  echo "salir de la seccion de misiones"
  adb shell input tap 900 50
  sleep 2.5s
}

MISIONES_EVENTO() {
  NUEVO_PASO "Misiones del Evento"
  echo "ir a la seccion de misiones"
  adb shell input tap 950 600
  sleep 1s
  adb shell input tap 90 $ROW_ICON_FIR_POS_Y
  sleep 1s
  
  echo "recibir regalos"
  
  for i in {1..4}
  do
    adb shell input tap 730 1300
    adb shell input tap 730 1480
    adb shell input tap 730 1650
    sleep 2s
    adb shell input tap 730 1300
    sleep 1s
  done

  echo "salir de la seccion de misiones"
  adb shell input tap $BTN_CENTER_POS_X 1980
  sleep 1s
  adb shell input tap 930 $ROW_ICON_FIR_POS_Y
  sleep 1s
}

# ARENA() {
#   NUEVO_PASO "Arena"
#   echo "ir a la seccion de arena"
#   adb shell input tap $COL_ICON_FIR_POS_X 700
# sleep 1s
#   echo "abrir modal de desafiar"
#   adb shell input tap $BTN_CENTER_POS_X 2000
# sleep 1s
#   for i in {1..3}
#   do
#     echo "desafiar ultimo jugador $i"
#     adb shell input tap 770 1400
# sleep 1s
#     echo "esperar por la batalla"
#     sleep 15s
#     echo "adb shell input tap fuera de la ventana"
# sleep 1s
#     adb shell input tap $BTN_CENTER_POS_X 1890
# sleep 1s
#   done
#   echo "salir de la seccion de arena"
#   adb shell input tap $BTN_CENTER_POS_X 1780
# sleep 1s
#   adb shell input tap 930 $ROW_ICON_FIR_POS_Y
# sleep 1s
# }

INTERMUNDIAL() {
  clear
  NUEVO_PASO "Guerra Intermundial"
  echo "navegar de esquina inferior izquierda a esquina superior derecha"
  for i in {1..60}
  do
    echo -e "\033[0;${LIGHTRED}madb shell input tap $i${ENDFORMAT}"
    sleep 1s
    adb shell input tap 970 300
    sleep 0.5s
  done
  echo "navegar de esquina inferior izquierda a esquina inferior derecha"
  for i in {1..60}
  do
    echo -e "\033[0;${LIGHTRED}madb shell input tap $i${ENDFORMAT}"
    sleep 1s
    adb shell input tap 970 1770
    sleep 0.5s
  done
}

MINERO() {
  NUEVO_PASO "Minero"

  if [[ $1 = "full" ]]; then
    echo "ir a la mina"
    adb shell input tap 190 760
    sleep 1s
  fi

  XX=(
    "100"
    "250"
    "420"
    "590"
    "750"
    "930"
  )

  YY=(
    "950"
    "1140"
    "1300"
    "1480"
    "1630"
    "1800"
    "1970"
  )

  for t in {1..17}
  do
    for j in "${YY[@]}"
    do
      for i in "${XX[@]}"
      do
        echo -e "\033[0;${LIGHTRED}madb shell input tap x:$i y:$j, round: $t${ENDFORMAT}"
        adb shell input tap $i $j
        adb shell input tap $i $j
      done
    done
    adb shell input tap $BTN_CENTER_POS_X 2100
  done

  if [[ $1 = "full" ]]; then
    sleep 0.5s
    echo "salir de la mina"
    adb shell input tap 920 2100
    sleep 1s
  fi
}

ESTACIONAR_P() {
  NUEVO_PASO "Estacionar"
  for t in {1..100}
  do
    adb -s 192.168.8.123:33981 shell input tap $BTN_CENTER_POS_X 1600
    adb -s 192.168.8.123:33981 shell input tap $BTN_RIGHT_POS_X 1250
    # sleep 0.1s
  done
}

ESTACIONAR_A() {
  NUEVO_PASO "Estacionar"
  for t in {1..100}
  do
    adb -s 192.168.8.107:39223 shell input tap $BTN_CENTER_POS_X 1750
    adb -s 192.168.8.107:39223 shell input tap $BTN_RIGHT_POS_X 1350
    # sleep 0.1s
  done
}
# ------------------------------------------- inicio

RECIBIR() {
  # clear
  # echo "antes de seguir haga lo siguiente:"
  # echo "- colecte 200 lamparas"
  # echo "- comprar tarjeta de minero en el estacionamiento"
  # echo "- hacer compra de alas en la tienda del clan"
  # echo "- luchar con monstruo de lava"
  # read -p "presione una tecla para continuar..."

  # COMPARTIR
  # TIENDA
  # ALMA_MARCIAL

  # # ------------------------------------------- menu principal
  # echo "abrir menu principal"
  # adb shell input tap $COL_ICON_FIR_POS_X 172
  # sleep 1s
  # CORREO
  # RULETA
  # AMIGOS
  # 7_DIAS
  # echo "salir del menu principal"
  # adb shell input tap 900 50
  # sleep 1s

  # echo "abrir seccion de lucha"
  # adb shell input tap 430 $ROW_ICON_FIR_POS_Y
  # sleep 1s

  # if [[ $1 = "all_missions" ]]; then
  #   # ------------------------------------------- lucha
  #   echo "navegar hacia arriba del menu de lucha"
  #   adb shell input swipe $BTN_CENTER_POS_X 800 $BTN_CENTER_POS_X 2200 100
  #   sleep 1s
  #   LAMPARA_MAGICA
  #   RUINAS_LLAMAS
  #   echo "navegar a la seccion de ciudad antigua"
  #   adb shell input swipe $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1000 2000
  #   sleep 1s
  #   CIUDAD_ANTIGUA
  #   TORRE_CRONOLOGICA
  #   SANTUARIO
  #   PROVOCACION
  # fi
  # echo "cerrar menu de lucha"
  # adb shell input tap 430 $ROW_ICON_FIR_POS_Y
  # sleep 1s
  
  # ------------------------------------------- torre
  echo "ir a la torre"
  adb shell input tap 610 $ROW_ICON_FIR_POS_Y
  sleep 1s
  # OFICIANTE
  MINERO "full"
  RESIDENCIA_SEGUIDORES
  ESTACIONAMIENTO
  HACIENDA
  echo "salir de la torre"
  adb shell input tap 610 $ROW_ICON_FIR_POS_Y
  sleep 1s

  # ------------------------------------------- clan
  echo "ir a la isla del clan"
  adb shell input tap 800 $ROW_ICON_FIR_POS_Y
  sleep 1s
  echo "navegar hasta abajo"
  adb shell input swipe $BTN_CENTER_POS_X 10 $BTN_CENTER_POS_X 2100 12000
  SALON
  PEZ
  echo "salir de la isla del clan"
  adb shell input tap 800 $ROW_ICON_FIR_POS_Y
  sleep 2.5s

  if [[ $1 = "all_missions" ]]; then
    # ------------------------------------------- recargas
    echo "abrir seccion de presentes de recarga"
    adb shell input tap $COL_ICON_FIR_POS_X 470
    sleep 1s
    # CONTRA_ATAQUE
    TARJETA_PRIVILEGIOS
    echo "navegar a evento"
    adb shell input tap 770 1600
    sleep 1s
    echo "navegar hacia arriba del menu de lucha"
    adb shell input swipe $BTN_CENTER_POS_X 830 $BTN_CENTER_POS_X 2200 100
    sleep 1s
    ESCALERAS_CRECIMIENTO
    OFERTAS_DIARIAS
    # BAUL_REEMBOLSO
    SUPER_TARJETA
    echo "salir de la seccion de recarga"
    adb shell input tap $BTN_CENTER_POS_X 1800
    sleep 1s
    
    MISIONES
  fi

  CHAT "full"
  MISIONES_EVENTO
}

if [[ $1 = "" ]]; then
  RECIBIR "all_missions"
elif [[ $1 = "s" ]]; then
  RECIBIR
elif [[ $1 = "inter" ]]; then
  INTERMUNDIAL
elif [[ $1 = "chat" ]]; then
  CHAT
elif [[ $1 = "miner" ]]; then
  MINERO
elif [[ $1 = "pa" ]]; then
  ESTACIONAR_A
elif [[ $1 = "pp" ]]; then
  ESTACIONAR_P
fi