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

CLICK_OUTSIDE() {
  echo -e "\033[0;${LIGHTBLUE}mclick fuera de la ventana${ENDFORMAT}"
  CLICK $BTN_CENTER_POS_X 280
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
  echo "abrir chat"
  CLICK 90 2030
  echo "abrir modal de regalos"
  CLICK 120 1810
  for i in {1..20}
  do
    echo "recibir el regalo $i de la lista"
    CLICK 190 640
    CLICK_OUTSIDE
  done
  echo "cerrar modal de regalos"
  CLICK $BTN_CENTER_POS_X 2100
  echo "salir del chat"
  CLICK 90 2030
}

ALMA_MARCIAL() {
  NUEVO_PASO "Alma Marciak"
  echo "abrir seccion de alma marcial"
  CLICK 910 1420
  echo "navegar a la seccion de obtencion de alma marcial"
  CLICK 880 1950
  echo "abrir provocacion de alma marcial"
  CLICK $BTN_CENTER_POS_X 860
  echo "abrir recompensas diarias"
  CLICK 900 470
  CLICK_OUTSIDE
  echo "salir de la seccion de provocacion de alma marcial"
  CLICK 890 2150
  echo "salir de la seccion de alma marcial"
  CLICK $BTN_CENTER_POS_X 2100
}

TIENDA() {
  NUEVO_PASO "Tienda"
  echo "ir a la tienda"
  CLICK 940 $ROW_ICON_FIR_POS_Y
  echo "tomar recompensas de paquete gratis"
  CLICK 300 1000
  CLICK_OUTSIDE
  echo "navegar a la seccion de roleta de habilidades"
  CLICK 170 2010
  for i in {1..3}
  do
    echo "invocar 35 veces"
    CLICK 300 1450
    CLICK $BTN_CENTER_POS_X 1900
  done
  echo "navegar a la seccion de roleta de companeros"
  CLICK 660 450
  for i in {1..3}
  do
    echo "invocar 35 veces"
    CLICK 300 1450
    CLICK $BTN_CENTER_POS_X 1900
  done
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
  CLICK_OUTSIDE
  echo "abrir modal de dar lates a la primera persona"
  CLICK 830 750
  echo "dar lates"
  CLICK $BTN_CENTER_POS_X 1470
  echo "salir de ver intimidad"
  CLICK $BTN_CENTER_POS_X 1840
  echo "salir de la seccion de oficiante"
  # CLICK $BTN_CENTER_POS_X 1600
  read -p "presione una tecla para continuar..."
}

RESIDENCIA_SEGUIDORES() {
  NUEVO_PASO "Residencia de Seguidores"
  echo "abrir residencia de seguidores"
  CLICK 870 1660
  echo "abrir el modal de recompensa"
  CLICK $BTN_CENTER_POS_X 2030
  echo "recibir recompensa online"
  CLICK $BTN_CENTER_POS_X 1730
  CLICK_OUTSIDE
  echo "ir a la seccion de recompensa offline"
  CLICK 700 870
  echo "recibir recompensa offline"
  CLICK $BTN_CENTER_POS_X 1730
  CLICK_OUTSIDE
  echo "cerrar modal de recompensa"
  CLICK_OUTSIDE
  echo "salir de la residencia de seguidores"
  CLICK 900 2140
}

ESTACIONAMIENTO() {
  NUEVO_PASO "Estacionamiento"
  echo "abrir estacionamiento"
  CLICK 830 1200
  echo "abrir tienda"
  CLICK 730 $ROW_ICON_FIR_POS_Y
  echo "abrir modal de comprar guia de transformacion"
  CLICK 320 1280
  echo "seleccionar maximo"
  CLICK 740 1110
  echo "comprar"
  CLICK $BTN_CENTER_POS_X 1260
  CLICK_OUTSIDE
  echo "navegar a tarjeta de recompensa offline"
  SWIPE $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1800
  echo "abrir modal de comprar tarjeta de recompensa offline"
  CLICK 320 1840
  echo "seleccionar maximo"
  CLICK 740 1110
  echo "comprar"
  CLICK $BTN_CENTER_POS_X 1260
  CLICK_OUTSIDE
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
    CLICK $BTN_CENTER_POS_X 1270
    CLICK $BTN_CENTER_POS_X 1700
    # CLICK_OUTSIDE
  done
  echo "navegar a la seccion de ayuda de clan"
  CLICK 420 1910
  echo "ayudar a todos"
  CLICK 540 1890
  CLICK_OUTSIDE
  echo "salir de la seccion de ayuda"
  CLICK $BTN_CENTER_POS_X 2000
  echo "salir del salon"
  CLICK $BTN_CENTER_POS_X 2000
}

TIENDA_CLAN() {
  NUEVO_PASO "Tienda del Clan"
  echo "ir a la tienda del clan"
  CLICK 980 620
  read -p "compre y presione una tecla para continuar..."
  # echo "navegar hacia las alas"
  # SWIPE $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1200
  # echo "abrir el menu de comprar la ala dorada"
  # CLICK 290 1030
  # echo "comprar"
  # CLICK $BTN_CENTER_POS_X 1250
  # CLICK_OUTSIDE
  # echo "abrir el menu de comprar la ala plateada"
  # CLICK 740 1020
  # echo "seleccionar 10"
  # CLICK 740 1080
  # echo "comprar"
  # CLICK $BTN_CENTER_POS_X 1250
  # CLICK_OUTSIDE
  echo "salir de la tienda del clan"
  CLICK $BTN_CENTER_POS_X 2000
}

LAVA() {
  NUEVO_PASO "Monstruo de Lava"
  echo "abrir el modal para desafiar el monstruo de lava"
  CLICK 10 1480
  # echo "abrir modal de raide"
  # CLICK $BTN_LEFT_POS_X 1690
  # for i in {1..2}
  # do
  #   echo "hacer raide $i"
  #   CLICK $BTN_CENTER_POS_X 1300
  #   CLICK_OUTSIDE
  # done
  # echo "cerrar modal de raide"
  # CLICK_OUTSIDE
  # echo "abrir modal de baul de lava"
  # CLICK 680 1230
  # echo "recibir baul avanzados"
  # CLICK $BTN_RIGHT_POS_X 1200
  # CLICK_OUTSIDE
  # echo "recibir baul comunes"
  # CLICK $BTN_RIGHT_POS_X 1550
  # CLICK_OUTSIDE
  # echo "salir del modal de baul de lava"
  # CLICK $BTN_CENTER_POS_X 1790
  read -p "luche, colecte y presione una tecla para continuar..."
  echo "salir de la seccion desafio de monstruo de lava"
  CLICK $BTN_CENTER_POS_X 1900
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
  echo "salir del correo"
  CLICK_OUTSIDE
  CLICK_OUTSIDE
}

RULETA() {
  NUEVO_PASO "Ruleta"
  echo "abrir ruleta"
  CLICK $COL_ICON_FIR_POS_X 900
  echo "girar ruleta"
  CLICK $BTN_CENTER_POS_X 1380
  sleep 10s
  echo "salir de la ruleta"
  CLICK_OUTSIDE
  CLICK_OUTSIDE
}

AMIGOS() {
  NUEVO_PASO "Amigos"
  echo "entrar seccion de amigos"
  CLICK $COL_ICON_FIR_POS_X 1070
  echo "dar y recibir"
  CLICK $BTN_CENTER_POS_X 1540
  echo "salir de la seccion de amigos"
  CLICK_OUTSIDE
  CLICK_OUTSIDE
}

7_DIAS() {
  NUEVO_PASO "7 Dias de Recompensas"
  echo "abrir seccion de 7 dias de recompensas"
  CLICK $COL_ICON_FIR_POS_X 1820
  echo "dia 1"
  CLICK 360 750
  CLICK 110 540
  echo "dia 2"
  CLICK 730 780
  CLICK 110 540
  echo "dia 3"
  CLICK 800 1120
  CLICK 110 540
  echo "dia 4"
  CLICK 480 1130
  CLICK 110 540
  echo "dia 5"
  CLICK 170 1220
  CLICK 110 540
  echo "dia 6"
  CLICK 190 1520
  CLICK 110 540
  echo "dia 7"
  CLICK 600 1500
  CLICK 110 540
  echo "salir de la seccion de 7 dias de recompensas"
  CLICK $BTN_CENTER_POS_X 1760
}

LAMPARA_MAGICA() {
  NUEVO_PASO "Ladron de Lampara Magica"
  echo "abrir menu de ladron de la lampara magica"
  CLICK 830 1430
  echo "abrir menu de raide"
  for i in {1..3}
  do
    echo "hacer raide $i"
    CLICK $BTN_LEFT_POS_X 1570
    CLICK_OUTSIDE
  done
  for i in {1..2}
  do
    echo "hacer raide de anuncios $i"
    CLICK $BTN_CENTER_POS_X 1570
    CLICK_OUTSIDE
    CLICK $BTN_LEFT_POS_X 1570
    CLICK_OUTSIDE
  done
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

RUINAS_LLAMAS() {
  NUEVO_PASO "Ruinas de las LLamas"
  echo "abrir menu de ruinas de las llamas"
  CLICK 830 1750
  echo "abrir menu de raide"
  for i in {1..3}
  do
    echo "hacer raide $i"
    CLICK $BTN_LEFT_POS_X 1570
    CLICK_OUTSIDE
  done
  for i in {1..2}
  do
    echo "hacer raide de anuncios $i"
    CLICK $BTN_CENTER_POS_X 1570
    CLICK_OUTSIDE
    CLICK $BTN_LEFT_POS_X 1570
    CLICK_OUTSIDE
  done
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

CIUDAD_ANTIGUA() {
  NUEVO_PASO "Ciudad Antigua"
  echo "abrir menu de ciudad antigua"
  CLICK 830 940
  echo "volver a la ruina anterior"
  CLICK 250 780
  echo "abrir menu de raide"
  for i in {1..3}
  do
    echo "hacer raide $i"
    CLICK $BTN_LEFT_POS_X 1920
    CLICK_OUTSIDE
  done
  for i in {1..2}
  do
    echo "hacer raide de anuncios $i"
    CLICK $BTN_LEFT_POS_X 1920
    CLICK_OUTSIDE
    CLICK $BTN_LEFT_POS_X 1920
    CLICK_OUTSIDE
  done
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 2150
  CLICK $BTN_RIGHT_POS_X 1260
}

TORRE_CRONOLOGICA() {
  NUEVO_PASO "Torre Cronologica"
  echo "abrir menu de torre cronologica"
  CLICK 830 1250
  echo "abrir menu de raide"
  for i in {1..3}
  do
    echo "hacer raide $i"
    CLICK $BTN_LEFT_POS_X 1570
    CLICK_OUTSIDE
  done
  for i in {1..2}
  do
    echo "hacer raide de anuncios $i"
    CLICK $BTN_CENTER_POS_X 1570
    CLICK_OUTSIDE
    CLICK $BTN_LEFT_POS_X 1570
    CLICK_OUTSIDE
  done
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

SANTUARIO() {
  NUEVO_PASO "Santuario de las LLamas"
  echo "abrir menu de santuario de llama ardiente"
  CLICK 830 1560
  echo "abrir menu de raide"
  for i in {1..3}
  do
    echo "hacer raide $i"
    CLICK $BTN_LEFT_POS_X 1620
    CLICK_OUTSIDE
  done
  for i in {1..2}
  do
    echo "hacer raide de anuncios $i"
    CLICK $BTN_CENTER_POS_X 1620
    CLICK_OUTSIDE
    CLICK $BTN_LEFT_POS_X 1620
    CLICK_OUTSIDE
  done
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
  CLICK_OUTSIDE
  CLICK $BTN_LEFT_POS_X 1370
  CLICK $BTN_RIGHT_POS_X 1260
  CLICK $BTN_CENTER_POS_X 1370
  CLICK $BTN_CENTER_POS_X 1630
  CLICK_OUTSIDE
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 2100
}

CONTRA_ATAQUE() {
  NUEVO_PASO "Contra Ataque"
  echo "abrir seccion de contra ataque"
  CLICK $BTN_CENTER_POS_X 740
  echo "navegar a la seccion de misiones"
  CLICK 700 2120
  for i in {1..14}
  do
    echo "recibir regalo $i"
    CLICK $BTN_CENTER_POS_X 560
  done
  echo "navegar a la seccion de recompensa de pase"
  CLICK 370 2120
  echo "colecte las recompensas"
  # echo "recibir recompensas de pase"
  # CLICK 830 590
  read -p "presione una tecla para continuar..."
  echo "cerrar seccion de contra ataque"
  CLICK 930 2150
}

TARJETA_PRIVILEGIOS() {
  NUEVO_PASO "Tarjeta de Privilegios"
  echo "navegar a tarjeta de privilegios"
  CLICK $BTN_CENTER_POS_X 1600
  echo "recibir rapido"
  CLICK $BTN_CENTER_POS_X 1500
  CLICK_OUTSIDE
}

ESCALERAS_CRECIMIENTO() {
  NUEVO_PASO "Escaleras de Crecimiento"
  echo "abrir menu de escaleras de crecimiento"
  CLICK $BTN_CENTER_POS_X 670
  echo "tomar recompensa"
  CLICK 770 470
  CLICK_OUTSIDE
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

OFERTAS_DIARIAS() {
  NUEVO_PASO "Ofertas Diarias"
  echo "abrir menu de ofertas diarias"
  CLICK $BTN_CENTER_POS_X 970
  echo "tomar recompensa"
  CLICK 770 470
  CLICK_OUTSIDE
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

BAUL_REEMBOLSO() {
  NUEVO_PASO "Baul de Reembolso"
  echo "abrir menu de baul reembolso"
  CLICK $BTN_CENTER_POS_X 1300
  echo "tomar recompensa"
  CLICK 770 520
  CLICK_OUTSIDE
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

SUPER_TARJETA() {
  NUEVO_PASO "Super Tarjeta"
  echo "abrir menu de super tarjeta"
  CLICK 500 1500
  echo "tomar recompensa"
  CLICK 770 470
  CLICK_OUTSIDE
  echo "cerrar modal"
  CLICK $BTN_CENTER_POS_X 1900
}

COMPARTIR() {
  NUEVO_PASO "Compartir"
  echo "abrir menu de compartir juego"
  CLICK $COL_ICON_SEC_POS_X 430
  echo "compartir con discord"
  CLICK $BTN_LEFT_POS_X 1480
  echo "cerrar navegador"
  adb shell am force-stop com.brave.browser
  ESPERA
  echo "recibir gemas de discord"
  CLICK 300 1350
  CLICK_OUTSIDE
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
    CLICK 800 870
    CLICK 175 510
  done
  echo "recibir diamante, llaves y ticket"
  CLICK 330 550
  CLICK_OUTSIDE
  echo "salir de la seccion de misiones"
  CLICK_OUTSIDE
}

# ------------------------------------------- inicio
INTERMUNDIAL() {
  clear
  NUEVO_PASO "Guerra Intermundial"
  echo "ir al mundo de reino hechizero"
  CLICK 740 770
  CLICK $BTN_CENTER_POS_X 1650
  echo "navegar al estremo izquierdo"
  SWIPE 40 300 970 300 0
  SWIPE 40 300 970 300 0
  SWIPE 40 300 970 300 0
  echo "seleccionar estremo inferior izquierdo"
  CLICK 200 1870
  echo "teletransportar"
  CLICK 850 2050
  echo "activar modo automatico"
  CLICK 450 2130
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

2100H() {
  clear
  echo "antes de seguir haga lo siguiente:"
  if [[ $1 = "all_missions" ]]; then
    echo "- verifique que tenga un maximo de 3 llaves"
  fi
  echo "- haga las 3 luchas de la arena"
  echo "- colecte 200 lamparas"
  read -p "presione una tecla para continuar..."
  
  COMPARTIR
  CHAT
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
  CLICK_OUTSIDE

  echo "abrir seccion de lucha"
  CLICK 430 $ROW_ICON_FIR_POS_Y

  if [[ $1 = "all_missions" ]]; then
    # ------------------------------------------- lucha
    LAMPARA_MAGICA
    RUINAS_LLAMAS
    echo "navegar a la seccion de ciudad antigua"
    SWIPE $BTN_CENTER_POS_X 1930 $BTN_CENTER_POS_X 1000
    CIUDAD_ANTIGUA
    TORRE_CRONOLOGICA  
    SANTUARIO
    PROVOCACION
  else
    read -p "haga sus luchas y presione una tecla para continuar..."
  fi
  echo "cerrar menu de lucha"
  CLICK 430 $ROW_ICON_FIR_POS_Y
  
  # ------------------------------------------- torre
  echo "ir a la torre"
  CLICK 610 $ROW_ICON_FIR_POS_Y
  OFICIANTE
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
  TIENDA_CLAN
  PEZ
  LAVA
  echo "salir de la isla del clan"
  CLICK 800 $ROW_ICON_FIR_POS_Y

  # ------------------------------------------- recargas
  echo "abrir seccion de presentes de recarga"
  CLICK $COL_ICON_FIR_POS_X 470
  CONTRA_ATAQUE
  TARJETA_PRIVILEGIOS
  echo "navegar a evento"
  CLICK 770 1600
  ESCALERAS_CRECIMIENTO
  OFERTAS_DIARIAS
  BAUL_REEMBOLSO
  SUPER_TARJETA
  echo "salir de la seccion de recarga"
  CLICK $BTN_CENTER_POS_X 1800
  
  MISIONES
  
}

700H() {
  clear  
  CHAT

  # ------------------------------------------- menu principal
  echo "abrir menu principal"
  CLICK $COL_ICON_FIR_POS_X 172
  CORREO
  echo "salir del menu principal"
  CLICK_OUTSIDE
  
  # ------------------------------------------- torre
  echo "ir a la torre"
  CLICK 610 $ROW_ICON_FIR_POS_Y
  RESIDENCIA_SEGUIDORES
  HACIENDA
  echo "salir de la torre"
  CLICK 610 $ROW_ICON_FIR_POS_Y

  # ------------------------------------------- clan
  echo "ir a la isla del clan"
  CLICK 800 $ROW_ICON_FIR_POS_Y
  echo "navegar hasta abajo"
  adb shell input swipe $BTN_CENTER_POS_X 10 $BTN_CENTER_POS_X 2100 12000
  SALON
  LAVA
  echo "salir de la isla del clan"
  CLICK 800 $ROW_ICON_FIR_POS_Y
}

if [[ $1 = "21" ]]; then
  2100H "all_missions"
elif [[ $1 = "7" ]]; then
  700H
elif [[ $1 = "21s" ]]; then
  2100H
elif [[ $1 = "inter" ]]; then
  INTERMUNDIAL
elif [[ $1 = "chat" ]]; then
  CHAT
fi



# -- parqueo
# -- check for pets fluctuantes
# -- porta do abismo x2
# -- luchar en la arena x3
# -- lucha arena interserver x10
# -- adubar plantas
# -- minas
# -- escadaria
# -- eventos de temporada (barco, panda, artes marciales)

# ------------------------------  notes
# Screenshoot
# adb exec-out screencap -p > screenshoot.png

# Recording
# adb shell screenrecord "/sdcard/Movies/recording.mp4"