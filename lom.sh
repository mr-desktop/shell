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

ESPERA() {
  echo -e "\033[0;${LIGHTBLUE}mesperar 4 segundos${ENDFORMAT}"
  sleep 4s
}

CLICK() {
  echo -e "\033[0;${LIGHTBLUE}mclick en el punto (x:$1 y:$2)${ENDFORMAT}"
  adb shell input tap $1 $2
  ESPERA
}

SWIPE() {
  echo -e "\033[0;${LIGHTBLUE}mswipe en el punto (x:$1 y:$2) hasta (x:$3 y:$4)${ENDFORMAT}"
  adb shell input swipe $1 $2 $3 $4 2000
  ESPERA
}

NUEVO_PASO() {
  echo -e "\033[0;${LIGHTYELLOW}m---------------------------------- $1${ENDFORMAT}"
}

# ------------------------------ pasos

CHAT() {
  NUEVO_PASO "Chat"

  if [[ $1 = "full" ]]; then    
    echo "abrir chat"
    adb shell input tap 90 2030
    sleep 0.5s
    echo "abrir modal de regalos"
    adb shell input tap 120 1810
    sleep 1s
  fi

  for i in {1..20}
  do
    echo -e "\033[0;${LIGHTRED}mclick x:190 y:640, time: $i${ENDFORMAT}"
    adb shell input tap 190 640
    sleep 0.5s
    echo -e "\033[0;${LIGHTRED}mclick x:900 y:400, time: $i${ENDFORMAT}"
    adb shell input tap 900 400
    sleep 0.5s
  done

  if [[ $1 = "full" ]]; then
    echo "cerrar modal de regalos"
    adb shell input tap $BTN_CENTER_POS_X 2100
    sleep 0.5s
    echo "salir del chat"
    adb shell input tap 90 2030
    sleep 0.5s
  fi
}

ALMA_MARCIAL() {
  NUEVO_PASO "Alma Marcial"
  echo "abrir seccion de alma marcial"
  CLICK 910 1420
  echo "navegar a la seccion de obtencion de alma marcial"
  CLICK 880 1950
  echo "abrir provocacion de alma marcial"
  CLICK $BTN_CENTER_POS_X 860
  echo "abrir recompensas diarias"
  CLICK 900 470
  CLICK 900 470
  echo "salir de la seccion de provocacion de alma marcial"
  CLICK 890 2150
  echo "salir de la seccion de alma marcial"
  CLICK $BTN_CENTER_POS_X 2100
}

RODAR_MAQUINA() {
  for i in {1..3}
  do
    echo "invocar 35 veces"
    adb shell input tap 300 1450
    sleep 2s
    adb shell input tap $BTN_CENTER_POS_X 1900
    sleep 1s
  done
}

TIENDA() {
  NUEVO_PASO "Tienda"
  echo "ir a la tienda"
  CLICK 940 $ROW_ICON_FIR_POS_Y
  echo "navegar hacia arriba del menu"
  adb shell input swipe $BTN_CENTER_POS_X 820 $BTN_CENTER_POS_X 2200 100
  ESPERA
  echo "tomar recompensas de paquete gratis"
  CLICK 300 1000
  CLICK 900 50
  echo "navegar a la seccion de roleta de habilidades"
  CLICK 170 2010
  RODAR_MAQUINA
  echo "navegar a la seccion de roleta de companeros"
  CLICK 660 450
  RODAR_MAQUINA
  echo "salir de la tienda"
  CLICK 940 $ROW_ICON_FIR_POS_Y
}

OFICIANTE() {
  NUEVO_PASO "Oficiante"
  echo "abrir seccion de oficiante"
  CLICK 590 750
  echo "abrir seccion de ver intimidad"
  CLICK 590 900
  echo "abrir modal de conseguir lates"
  CLICK 350 320
  echo "aumentar la cantidad de lates"
  CLICK 750 1080
  echo "comprar lates"
  CLICK $BTN_CENTER_POS_X 1250
  CLICK $BTN_CENTER_POS_X 430
  echo "abrir modal de dar lates a la primera persona"
  CLICK 830 750
  echo "dar lates"
  CLICK $BTN_CENTER_POS_X 1470
  echo "salir de ver intimidad"
  CLICK $BTN_CENTER_POS_X 1840
  echo "salir de la seccion de oficiante"
  CLICK $BTN_CENTER_POS_X 1600
  CLICK $BTN_CENTER_POS_X 1280
}

RESIDENCIA_SEGUIDORES() {
  NUEVO_PASO "Residencia de Seguidores"
  echo "abrir residencia de seguidores"
  CLICK 870 1660
  echo "abrir el modal de recompensa"
  CLICK $BTN_CENTER_POS_X 2030
  echo "recibir recompensa online"
  CLICK $BTN_CENTER_POS_X 1730
  CLICK $BTN_CENTER_POS_X 1730
  echo "ir a la seccion de recompensa offline"
  CLICK 700 870
  echo "recibir recompensa offline"
  CLICK $BTN_CENTER_POS_X 1730
  CLICK $BTN_CENTER_POS_X 1730
  echo "cerrar modal de recompensa"
  CLICK 900 50
  echo "salir de la residencia de seguidores"
  CLICK 900 2140
}

ESTACIONAMIENTO() {
  NUEVO_PASO "Estacionamiento"
  echo "abrir estacionamiento"
  CLICK 830 1200
  echo "abrir tienda"
  CLICK 730 $ROW_ICON_FIR_POS_Y
  echo "navegar hacia arriba del menu"
  adb shell input swipe $BTN_CENTER_POS_X 820 $BTN_CENTER_POS_X 2200 100
  adb shell input swipe $BTN_CENTER_POS_X 820 $BTN_CENTER_POS_X 2200 100
  ESPERA
  echo "abrir modal de comprar guia de transformacion"
  adb shell input tap 320 1280
  sleep 0.5s
  echo "seleccionar maximo"
  adb shell input tap 740 1110
  echo "comprar"
  adb shell input tap $BTN_CENTER_POS_X 1260
  sleep 0.2s
  # CLICK 900 630
  echo "navegar a tarjeta de recompensa offline"
  SWIPE $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1800
  
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
    sleep 0.2s
    # sleep 0.5s
    # adb shell input tap 900 630
  done
  echo "salir del estacionamiento"
  CLICK 900 $ROW_ICON_FIR_POS_Y
}

HACIENDA() {
  NUEVO_PASO "Hacienda"
  echo "abrir hacienda"
  CLICK 400 1590
  echo "colectar cosecha"
  CLICK 160 2000
  sleep 6s
  CLICK 160 2000
  sleep 4s
  echo "abrir modal de sembrar"
  CLICK 160 2000
  echo "sembrar"
  CLICK $BTN_CENTER_POS_X 1310
  echo "abrir tienda"
  CLICK 700 $ROW_ICON_FIR_POS_Y
  echo "abrir modal de compra de abono"
  CLICK 700 1250
  echo "seleccionar 5"
  CLICK 730 1100
  echo "comprar"
  CLICK $BTN_CENTER_POS_X 1290
  CLICK 900 630
  echo "salir de la hacienda"
  CLICK 900 $ROW_ICON_FIR_POS_Y
}

SALON() {
  NUEVO_PASO "Salon del Clan"
  echo "abrir el modal del salon"
  CLICK 380 350
  echo "abrir modal de donaciones"
  CLICK 630 1900
  for i in {1..5}
  do
    echo "donar al clan $i"
    adb shell input tap $BTN_CENTER_POS_X 1270
    sleep 2s
    adb shell input tap $BTN_CENTER_POS_X 1270
  done
  echo "navegar a la seccion de ayuda de clan"
  CLICK 420 1910
  echo "ayudar a todos"
  CLICK $BTN_CENTER_POS_X 1890
  CLICK $BTN_CENTER_POS_X 1890
  echo "salir de la seccion de ayuda"
  CLICK $BTN_CENTER_POS_X 2000
  echo "salir del salon"
  CLICK $BTN_CENTER_POS_X 2000
}

PEZ() {
  NUEVO_PASO "Pez Enojado"
  echo "abrir modal para inscribirse en el pez enojado"
  CLICK 870 1540
  echo "inscribirse"
  CLICK $BTN_CENTER_POS_X 1640
  CLICK $BTN_CENTER_POS_X 1640
  echo "salir del menu de inscripcion"
  CLICK $BTN_CENTER_POS_X 1780
}

CORREO() {
  NUEVO_PASO "Correo"
  echo "abrir correo"
  CLICK $COL_ICON_FIR_POS_X 765
  echo "recibir correo"
  CLICK $BTN_RIGHT_POS_X 1640
  CLICK $BTN_RIGHT_POS_X 1640
  echo "salir del correo"
  CLICK $BTN_CENTER_POS_X 1810
}

RULETA() {
  NUEVO_PASO "Ruleta"
  echo "abrir ruleta"
  CLICK $COL_ICON_FIR_POS_X 900
  echo "girar ruleta"
  CLICK $BTN_CENTER_POS_X 1380
  sleep 10s
  CLICK $BTN_CENTER_POS_X 1380
  echo "salir de la ruleta"
  CLICK 50 420
}

AMIGOS() {
  NUEVO_PASO "Amigos"
  echo "entrar a la seccion de amigos"
  CLICK $COL_ICON_FIR_POS_X 1070
  echo "dar y recibir"
  CLICK $BTN_CENTER_POS_X 1540
  CLICK $BTN_CENTER_POS_X 1540
  echo "salir de la seccion de amigos"
  CLICK $BTN_CENTER_POS_X 1760
}

7_DIAS() {
  NUEVO_PASO "7 Dias de Recompensas"
  echo "abrir seccion de 7 dias de recompensas"
  CLICK $COL_ICON_FIR_POS_X 1820
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
  CLICK $BTN_CENTER_POS_X 1760
}

RAIDE() {
  for i in {1..12}
  do
    echo "hacer raide $i"
    adb shell input tap $1 $2
    sleep 0.5s
    adb shell input tap $1 $2
    sleep 0.5s
  done
}

LAMPARA_MAGICA() {
  NUEVO_PASO "Ladron de Lampara Magica"
  echo "abrir menu de ladron de la lampara magica"
  CLICK 830 1430
  RAIDE 450 1570
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

RUINAS_LLAMAS() {
  NUEVO_PASO "Ruinas de las LLamas"
  echo "abrir menu de ruinas de las llamas"
  CLICK 830 1750
  RAIDE 450 1570
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

CIUDAD_ANTIGUA() {
  NUEVO_PASO "Ciudad Antigua"
  echo "abrir menu de ciudad antigua"
  CLICK 830 940
  echo "volver a la ruina anterior"
  CLICK 250 780
  RAIDE 410 1920
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 2150
  CLICK $BTN_RIGHT_POS_X 1260
}

TORRE_CRONOLOGICA() {
  NUEVO_PASO "Torre Cronologica"
  echo "abrir menu de torre cronologica"
  CLICK 830 1250
  echo "abrir menu de raide"
  RAIDE 450 1570
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

SANTUARIO() {
  NUEVO_PASO "Santuario de las LLamas"
  echo "abrir menu de santuario de llama ardiente"
  CLICK 830 1560
  echo "abrir menu de raide"
  RAIDE 410 1620
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

PROVOCACION() {
  NUEVO_PASO "Provocacion de Oscuridad"
  echo "abrir menu de provocacion de oscuridad"
  CLICK 830 1850
  echo "comenzar raide"
  CLICK $BTN_CENTER_POS_X 1370
  CLICK $BTN_CENTER_POS_X 1630
  CLICK 150 680
  CLICK $BTN_LEFT_POS_X 1370
  CLICK $BTN_RIGHT_POS_X 1260
  CLICK $BTN_CENTER_POS_X 1370
  CLICK $BTN_CENTER_POS_X 1630
  CLICK 150 680
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 2100
}

# CONTRA_ATAQUE() {
#   NUEVO_PASO "Contra Ataque"
#   echo "abrir seccion de contra ataque"
#   CLICK $BTN_CENTER_POS_X 740
#   echo "navegar a la seccion de misiones"
#   CLICK 700 2120
#   for i in {1..14}
#   do
#     echo "recibir regalo $i"
#     CLICK $BTN_CENTER_POS_X 560
#   done
#   echo "cerrar seccion de contra ataque"
#   CLICK 930 2150
# }

TARJETA_PRIVILEGIOS() {
  NUEVO_PASO "Tarjeta de Privilegios"
  echo "navegar a tarjeta de privilegios"
  CLICK $BTN_CENTER_POS_X 1600
  echo "recibir rapido"
  CLICK $BTN_CENTER_POS_X 1500
  CLICK 180 580
}

ESCALERAS_CRECIMIENTO() {
  NUEVO_PASO "Escaleras de Crecimiento"
  echo "abrir menu de escaleras de crecimiento"
  CLICK $BTN_CENTER_POS_X 670
  echo "tomar recompensa"
  CLICK 770 470
  CLICK 770 470
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

OFERTAS_DIARIAS() {
  NUEVO_PASO "Ofertas Diarias"
  echo "abrir menu de ofertas diarias"
  CLICK $BTN_CENTER_POS_X 970
  echo "tomar recompensa"
  CLICK 770 470
  CLICK 770 470
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

BAUL_REEMBOLSO() {
  NUEVO_PASO "Baul de Reembolso"
  echo "abrir menu de baul reembolso"
  CLICK $BTN_CENTER_POS_X 1300
  echo "tomar recompensa"
  CLICK 770 520
  CLICK 770 520
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

SUPER_TARJETA() {
  NUEVO_PASO "Super Tarjeta"
  echo "abrir menu de super tarjeta"
  CLICK 500 1500
  echo "tomar recompensa"
  CLICK 770 470
  CLICK 770 470
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

COMPARTIR() {
  NUEVO_PASO "Compartir"
  echo "abrir menu de compartir juego"
  CLICK $COL_ICON_SEC_POS_X 430
  # CLICK $COL_ICON_SEC_POS_X 360
  echo "compartir con discord"
  CLICK $BTN_LEFT_POS_X 1480
  echo "cerrar navegador"
  adb shell am force-stop com.brave.browser
  ESPERA
  echo "recibir gemas de discord"
  CLICK 300 1350
  CLICK 300 1350
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 2140
}

MISIONES() {
  NUEVO_PASO "Misiones"
  echo "ir a la seccion de misiones"
  CLICK $COL_ICON_FIR_POS_X 550
  for i in {1..14}
  do
    echo "recibir regalo $i"
    adb shell input tap 800 870
    sleep 2s
    adb shell input tap 175 510
  done
  echo "recibir diamantes, llaves y ticket"
  CLICK 330 550
  CLICK 170 570
  echo "salir de la seccion de misiones"
  CLICK 900 50
}

MISIONES_EVENTO() {
  NUEVO_PASO "Misiones del Evento"
  echo "ir a la seccion de misiones"
  CLICK 950 460
  CLICK 90 $ROW_ICON_FIR_POS_Y
  
  for i in {1..10}
  do
    echo "recibir regalo $i"
    CLICK 730 1300
    CLICK 730 1300
  done
  echo "salir de la seccion de misiones"
  CLICK $BTN_CENTER_POS_X 1980
  CLICK 930 $ROW_ICON_FIR_POS_Y
}

# ARENA() {
#   NUEVO_PASO "Arena"
#   echo "ir a la seccion de arena"
#   CLICK $COL_ICON_FIR_POS_X 700
#   echo "abrir modal de desafiar"
#   CLICK $BTN_CENTER_POS_X 2000
#   for i in {1..3}
#   do
#     echo "desafiar ultimo jugador $i"
#     CLICK 770 1400
#     echo "esperar por la batalla"
#     sleep 15s
#     echo "click fuera de la ventana"
#     CLICK $BTN_CENTER_POS_X 1890
#     ESPERA
#   done
#   echo "salir de la seccion de arena"
#   CLICK $BTN_CENTER_POS_X 1780
#   CLICK 930 $ROW_ICON_FIR_POS_Y
# }

INTERMUNDIAL() {
  clear
  NUEVO_PASO "Guerra Intermundial"
  # echo "ir al mundo de reino hechizero"
  # CLICK 740 770
  # CLICK $BTN_CENTER_POS_X 1650
  # echo "navegar al estremo izquierdo"
  # SWIPE 40 300 970 300 0
  # SWIPE 40 300 970 300 0
  # SWIPE 40 300 970 300 0
  # echo "seleccionar estremo inferior izquierdo"
  # CLICK 200 1870
  # echo "teletransportar"
  # CLICK 850 2050
  # echo "activar modo automatico"
  # CLICK 450 2130
  echo "navegar de esquina inferior izquierda a esquina superior derecha"
  for i in {1..235}
  do
    echo -e "\033[0;${LIGHTRED}mclick $i${ENDFORMAT}"
    adb shell input tap 970 300
    sleep 0.5s
  done
  echo "navegar de esquina inferior izquierda a esquina inferior derecha"
  for i in {1..280}
  do
    echo -e "\033[0;${LIGHTRED}mclick $i${ENDFORMAT}"
    adb shell input tap 970 1770
    sleep 0.5s
  done
}

MINERO() {
  NUEVO_PASO "Minero"

  if [[ $1 = "full" ]]; then
    echo "ir a la mina"
    CLICK 190 760
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

  for t in {1..15}
  do
    for j in "${YY[@]}"
    do
      for i in "${XX[@]}"
      do
        echo -e "\033[0;${LIGHTRED}mclick x:$i y:$j, time: $t${ENDFORMAT}"
        adb shell input tap $i $j
        adb shell input tap $i $j
      done
    done
    adb shell input tap $BTN_CENTER_POS_X 2100
  done

  if [[ $1 = "full" ]]; then
    sleep 0.5s
    echo "salir de la mina"
    CLICK 920 2100
  fi
}

ESTACIONAR_P() {
  NUEVO_PASO "Estacionar"
  for t in {1..100}
  do
    adb -s 192.168.8.123:38963 shell input tap $BTN_CENTER_POS_X 1600
    adb -s 192.168.8.123:38963 shell input tap $BTN_RIGHT_POS_X 1250
    # sleep 0.1s
  done
}

ESTACIONAR_A() {
  NUEVO_PASO "Estacionar"
  for t in {1..100}
  do
    adb -s 192.168.8.107:40501 shell input tap $BTN_CENTER_POS_X 1750
    adb -s 192.168.8.107:40501 shell input tap $BTN_RIGHT_POS_X 1350
    # sleep 0.1s
  done
}
# ------------------------------------------- inicio

RECIBIR() {
  clear
  echo "antes de seguir haga lo siguiente:"
  echo "- colecte 200 lamparas"
  echo "- comprar tarjeta de minero en el estacionamiento"
  echo "- hacer compra de alas en la tienda del clan"
  echo "- luchar con monstruo de lava"
  read -p "presione una tecla para continuar..."
  
  # ARENA

  COMPARTIR
  TIENDA
  ALMA_MARCIAL

  # ------------------------------------------- menu principal
  echo "abrir menu principal"
  CLICK $COL_ICON_FIR_POS_X 172
  CORREO
  RULETA
  AMIGOS
  7_DIAS
  echo "salir del menu principal"
  CLICK 900 50

  echo "abrir seccion de lucha"
  CLICK 430 $ROW_ICON_FIR_POS_Y

  if [[ $1 = "all_missions" ]]; then
    # ------------------------------------------- lucha
    echo "navegar hacia arriba del menu de lucha"
    adb shell input swipe $BTN_CENTER_POS_X 800 $BTN_CENTER_POS_X 2200 100
    ESPERA
    LAMPARA_MAGICA
    RUINAS_LLAMAS
    echo "navegar a la seccion de ciudad antigua"
    SWIPE $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1000
    CIUDAD_ANTIGUA
    TORRE_CRONOLOGICA  
    SANTUARIO
    PROVOCACION
  fi
  echo "cerrar menu de lucha"
  CLICK 430 $ROW_ICON_FIR_POS_Y
  
  # ------------------------------------------- torre
  echo "ir a la torre"
  CLICK 610 $ROW_ICON_FIR_POS_Y
  MINERO "full"
  # OFICIANTE
  RESIDENCIA_SEGUIDORES
  ESTACIONAMIENTO
  HACIENDA
  echo "salir de la torre"
  CLICK 610 $ROW_ICON_FIR_POS_Y

  # ------------------------------------------- clan
  echo "ir a la isla del clan"
  CLICK 800 $ROW_ICON_FIR_POS_Y
  echo "navegar hasta abajo"
  adb shell input swipe $BTN_CENTER_POS_X 10 $BTN_CENTER_POS_X 2100 12000
  SALON
  PEZ
  echo "salir de la isla del clan"
  CLICK 800 $ROW_ICON_FIR_POS_Y

  if [[ $1 = "all_missions" ]]; then
    # ------------------------------------------- recargas
    echo "abrir seccion de presentes de recarga"
    CLICK $COL_ICON_FIR_POS_X 470
    # CONTRA_ATAQUE
    TARJETA_PRIVILEGIOS
    echo "navegar a evento"
    CLICK 770 1600
    echo "navegar hacia arriba del menu de lucha"
    adb shell input swipe $BTN_CENTER_POS_X 830 $BTN_CENTER_POS_X 2200 100
    ESPERA
    ESCALERAS_CRECIMIENTO
    OFERTAS_DIARIAS
    # BAUL_REEMBOLSO
    SUPER_TARJETA
    echo "salir de la seccion de recarga"
    CLICK $BTN_CENTER_POS_X 1800
    
    MISIONES
  fi

  CHAT "full"
}
# MISIONES_EVENTO

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