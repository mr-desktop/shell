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

# ------------------------------ lom: pasos
# CHAT() {
#   TITULO "Chat"

#   if [[ $1 = "full" ]]; then    
#     echo "abrir chat"
#     adb shell input tap 50 2030
#     sleep 1s
#     echo "abrir modal de regalos"
#     adb shell input tap 120 1810
#     sleep 2.5s
#   fi

#   XX=(
#     190
#     510
#     800
#   )

#   YY=(
#     640
#     1000
#   )

#   for t in {1..4}
#   do
#     for j in "${YY[@]}"
#     do
#       for i in "${XX[@]}"
#       do
#         echo_c $LIGHTBLUE "tap x:$i y:$j, round: $t"
#         adb shell input tap $i $j
#       done
#     done
#     sleep 2s
#     adb shell input tap 900 400
#   done

#   if [[ $1 = "full" ]]; then
#     echo "cerrar modal de regalos"
#     adb shell input tap 520 2100
#     sleep 0.5s
#     echo "salir del chat"
#     adb shell input tap 90 2030
#     sleep 1s
#   fi
# }

ALMA_MARCIAL() {
  TITULO "Alma Marcial"
  echo "abrir seccion de alma marcial"
  adb shell input tap 910 1500
  sleep 1s
  echo "navegar a la seccion de obtencion de alma marcial"
  adb shell input tap 880 1950
  sleep 1s
  echo "abrir provocacion de alma marcial"
  adb shell input tap 520 860
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
  adb shell input tap 520 2100
  sleep 1s
}

RODAR_MAQUINA() {
  for i in {1..3}
  do
    echo "invocar 35 veces"
    adb shell input tap 300 1450
  done
  sleep 2s
  adb shell input tap 520 1900
  sleep 1s
}

TIENDA() {
  TITULO "Tienda"
  echo "ir a la tienda"
  adb shell input tap 940 2180
  sleep 1s
  # echo "navegar hacia arriba del menu"
  # adb shell input swipe 520 820 520 2200 100
  # sleep 1s
  # echo "tomar recompensas de paquete gratis"
  # adb shell input tap 300 1000
  # sleep 2.5s
  # adb shell input tap 900 50
  # sleep 1s
  echo "navegar a la seccion de roleta de habilidades"
  adb shell input tap 170 2010
  sleep 2.5s
  RODAR_MAQUINA
  echo "navegar a la seccion de roleta de companeros"
  adb shell input tap 660 450
  sleep 1s
  RODAR_MAQUINA
  echo "salir de la tienda"
  adb shell input tap 940 2180
  sleep 1s
}

OFICIANTE() {
  TITULO "Oficiante"
  
  # echo "ir a la torre"
  # adb shell input tap 610 2180
  # sleep 1s
  
  echo "abrir seccion de oficiante"
  adb shell input tap 590 750
  sleep 2s
  # echo "abrir seccion de ver intimidad"
  # adb shell input tap 590 900
  # sleep 2s
  echo "abrir modal de conseguir lates"
  adb shell input tap 350 320
  sleep 2s
  echo "aumentar la cantidad de lates"
  adb shell input tap 750 1080
  sleep 1s
  echo "comprar lates"
  adb shell input tap 520 1250
  sleep 2s
  adb shell input tap 520 430
  sleep 2s
  echo "abrir modal de dar lates a la primera persona"
  adb shell input tap 830 750
  sleep 1s
  echo "dar lates"
  adb shell input tap 520 1470
  sleep 1s
  echo "salir de ver intimidad"
  adb shell input tap 520 1840
  sleep 1s
  # adb shell input tap 520 1600
  # sleep 1s
  # adb shell input tap 610 2180
  # sleep 1s
}

RESIDENCIA_SEGUIDORES() {
  TITULO "Residencia de Seguidores"
  echo "abrir residencia de seguidores"
  adb shell input tap 870 1660
  sleep 1s
  echo "abrir el modal de recompensa"
  adb shell input tap 520 2030
  sleep 2.5s
  echo "recibir recompensa online"
  adb shell input tap 520 1730
  sleep 2.5s
  adb shell input tap 520 1730
  sleep 1s
  echo "ir a la seccion de recompensa offline"
  adb shell input tap 700 870
  sleep 2.5s
  echo "recibir recompensa offline"
  adb shell input tap 520 1730
  sleep 2.5s
  adb shell input tap 520 1730
  sleep 2s
  echo "cerrar modal de recompensa"
  adb shell input tap 900 50
  sleep 1s
  echo "salir de la residencia de seguidores"
  adb shell input tap 900 2140
  sleep 1s
}

ESTACIONAMIENTO() {
  TITULO "Estacionamiento"
  echo "abrir estacionamiento"
  adb shell input tap 830 1200
  sleep 1s
  echo "abrir tienda"
  adb shell input tap 730 2180
  sleep 1s
  echo "navegar hacia arriba del menu"
  adb shell input swipe 520 820 520 2200 100
  adb shell input swipe 520 820 520 2200 100
  sleep 1s
  echo "abrir modal de comprar guia de transformacion"
  adb shell input tap 320 1280
  sleep 1s
  echo "seleccionar maximo"
  adb shell input tap 740 1110
  echo "comprar"
  adb shell input tap 520 1260
  sleep 2.5s
  adb shell input tap 900 630
  sleep 1s
  # echo "navegar a tarjeta de recompensa offline"
  # adb shell input swipe 520 1930 520 1800 2000
  # sleep 1s

  # YY=(
  #   1840
  #   1860
  #   1890
  #   1900
  #   1920
  # )

  # for t in "${YY[@]}"
  # do
  #   echo "abrir modal de comprar tarjeta de recompensa offline"
  #   adb shell input tap 320 $YY
  #   sleep 0.5s
  #   echo "seleccionar maximo"
  #   adb shell input tap 740 1110
  #   # sleep 1s
  #   echo "comprar"
  #   adb shell input tap 520 1260
  #   sleep 0.5s
  #   adb shell input tap 900 630
  #   sleep 0.2s
  # done
  echo "salir del estacionamiento"
  adb shell input tap 900 2180
  sleep 1s
}

ORAR() {
  for t in {1..700}
  do
    adb shell input tap 500 2130
    sleep 1.5s
  done  
}

COSECHAR() {
  XX=(
    220
    550
    840
  )

  YY=(
    1400
    1820
  )

  for t in {1..30}
  do
    adb shell input tap 140 1970
    sleep 1.5s
    adb shell input tap 720 1050
    sleep 1.5s
    adb shell input tap 500 1300
    sleep 7s

    for i in "${XX[@]}"
    do
      for j in "${YY[@]}"
      do
        adb shell input tap $i $j
        sleep 1.5s
        adb shell input tap 500 1500
        sleep 1.5s
        adb shell input tap 360 990
        sleep 1.5s
        adb shell input tap 260 1170
        sleep 1.5s
        adb shell input tap 500 1350
        sleep 2s
      done
    done
    adb shell input tap 140 1980
    sleep 1.5s
    adb shell input tap 670 1000
    sleep 1.5s
    adb shell input tap 500 1360
    sleep 1.5s
    adb shell input tap 140 1980
    sleep 8s
    adb shell input tap 140 1980
    sleep 2s
  done
}

HACIENDA() {
  TITULO "Hacienda"
  echo "abrir hacienda"
  adb shell input tap 400 1590
  sleep 1s
  echo "abrir tienda"
  adb shell input tap 700 2180
  sleep 1s
  echo "abrir modal de compra de abono"
  adb shell input tap 700 1250
  sleep 1s
  echo "seleccionar 5"
  adb shell input tap 730 1100
  sleep 1s
  echo "comprar"
  adb shell input tap 520 1290
  sleep 2.5s
  adb shell input tap 900 630
  sleep 1s
  echo "salir de la hacienda"
  adb shell input tap 900 2180
  sleep 1s
}

SALON() {
  TITULO "Salon del Clan"
  echo "abrir el modal del salon"
  adb shell input tap 380 350
  sleep 1s
  echo "abrir modal de donaciones"
  adb shell input tap 630 1900
  sleep 1s
  echo "donar al clan"
  for i in {1..15}
  do
    adb shell input tap 520 1270
  done
  sleep 2s
  adb shell input tap 520 1270
  sleep 2s
  echo "navegar a la seccion de ayuda de clan"
  adb shell input tap 420 1910
  sleep 1s
  echo "ayudar a todos"
  adb shell input tap 520 1890
  sleep 2s
  adb shell input tap 520 1890
  sleep 1s
  echo "salir de la seccion de ayuda"
  adb shell input tap 520 2000
  sleep 1.5s
  echo "salir del salon"
  adb shell input tap 520 2000
  sleep 2s
}

PEZ() {
  TITULO "Pez Enojado"
  echo "abrir modal para inscribirse en el pez enojado"
  adb shell input tap 870 1540
  sleep 2.5s
  echo "inscribirse"
  adb shell input tap 520 1640
  sleep 1s
  adb shell input tap 520 1640
  sleep 1s
  echo "salir del menu de inscripcion"
  adb shell input tap 520 1780
  sleep 1s
}

CORREO() {
  TITULO "Correo"
  echo "abrir correo"
  adb shell input tap 80 765
  sleep 1s
  echo "recibir correo"
  adb shell input tap 711 1640
  sleep 2.5s
  adb shell input tap 711 1640
  sleep 1s
  echo "salir del correo"
  adb shell input tap 520 1810
  sleep 1s
}

AMIGOS() {
  TITULO "Amigos"
  echo "entrar a la seccion de amigos"
  adb shell input tap 80 1070
  sleep 2.5s
  echo "dar y recibir"
  adb shell input tap 520 1540
  sleep 2.5s
  adb shell input tap 520 1540
  sleep 1s
  echo "salir de la seccion de amigos"
  adb shell input tap 520 1760
  sleep 1s
}

LAMPARA_MAGICA() {
  TITULO "Ladron de Lampara Magica"
  echo "abrir menu de ladron de la lampara magica"
  adb shell input tap 830 1430
  sleep 1s

  echo "hacer raide"
  for i in {1..80}
  do
    adb shell input tap 450 1570
  done

  echo "cerrar modal"
  adb shell input tap 520 1900
  sleep 1s
}

RUINAS_LLAMAS() {
  TITULO "Ruinas de las LLamas"
  echo "abrir menu de ruinas de las llamas"
  adb shell input tap 830 1750
  sleep 1s

  echo "hacer raide"
  for i in {1..80}
  do
    adb shell input tap 450 1570
  done

  echo "cerrar modal"
  adb shell input tap 520 1900
  sleep 1s
}

CIUDAD_ANTIGUA() {
  TITULO "Ciudad Antigua"
  echo "abrir menu de ciudad antigua"
  adb shell input tap 830 940
  sleep 2.5s
  # echo "volver a la ruina anterior" 
  # adb shell input tap 250 780
  # sleep 1s

  echo "hacer raide"
  for i in {1..80}
  do
    adb shell input tap 330 1920
  done

  echo "cerrar modal"
  adb shell input tap 520 2079
  sleep 1s
  adb shell input tap 711 1260
  sleep 1s
}

TORRE_CRONOLOGICA() {
  TITULO "Torre Cronologica"
  echo "abrir menu de torre cronologica"
  adb shell input tap 830 1250
  sleep 1s
  echo "abrir menu de raide"

  echo "hacer raide"
  for i in {1..80}
  do
    adb shell input tap 450 1570
  done

  echo "cerrar modal"
  adb shell input tap 520 1900
  sleep 1s
}

SANTUARIO() {
  TITULO "Santuario de las LLamas"
  echo "abrir menu de santuario de llama ardiente"
  adb shell input tap 830 1560
  sleep 1s
  echo "abrir menu de raide"

  echo "hacer raide"
  for i in {1..80}
  do
    adb shell input tap 410 1600
  done

  echo "cerrar modal"
  adb shell input tap 520 1900
  sleep 1s
}

PROVOCACION() {
  TITULO "Provocacion de Oscuridad"
  echo "abrir menu de provocacion de oscuridad"
  adb shell input tap 830 1850
  sleep 2.5s
  echo "comenzar raide"
  adb shell input tap 520 1370
  sleep 2.5s
  adb shell input tap 520 1630
  sleep 1s
  adb shell input tap 150 680
  sleep 1s
  for i in {1..1}
  do
    echo "redefinir $1"
    adb shell input tap 340 1370
    sleep 1s
    adb shell input tap 711 1260
    sleep 1s
    adb shell input tap 520 1370
    sleep 1s
    adb shell input tap 520 1630
    sleep 1s
    adb shell input tap 150 680
    sleep 2.5s
  done
  echo "cerrar modal"
  adb shell input tap 520 2100
  sleep 1s
}

# CONTRA_ATAQUE() {
#   TITULO "Contra Ataque"
#   echo "abrir seccion de contra ataque"
#   adb shell input tap 520 740
# sleep 1s
#   echo "navegar a la seccion de misiones"
#   adb shell input tap 700 2120
# sleep 1s
#   for i in {1..14}
#   do
#     echo "recibir regalo $i"
#     adb shell input tap 520 560
# sleep 1s
#   done
#   echo "cerrar seccion de contra ataque"
#   adb shell input tap 930 2150
# sleep 1s
# }

# TARJETA_PRIVILEGIOS() {
#   TITULO "Tarjeta de Privilegios"
#   echo "navegar a tarjeta de privilegios"
#   adb shell input tap 520 1600
#   sleep 1s
#   echo "recibir rapido"
#   adb shell input tap 520 1500
#   sleep 2.5s
#   adb shell input tap 180 580
#   sleep 1s
# }

# ESCALERAS_CRECIMIENTO() {
#   TITULO "Escaleras de Crecimiento"
#   echo "abrir menu de escaleras de crecimiento"
#   adb shell input tap 520 670
#   sleep 1s
#   echo "tomar recompensa"
#   adb shell input tap 770 470
#   sleep 2.5s
#   adb shell input tap 770 470
#   sleep 1s
#   echo "cerrar modal"
#   adb shell input tap 520 1900
#   sleep 1s
# }

# OFERTAS_DIARIAS() {
#   TITULO "Ofertas Diarias"
#   echo "abrir menu de ofertas diarias"
#   adb shell input tap 520 970
#   sleep 1s
#   echo "tomar recompensa"
#   adb shell input tap 770 470
#   sleep 2.5s
#   adb shell input tap 770 470
#   sleep 1s
#   echo "cerrar modal"
#   adb shell input tap 520 1900
#   sleep 1s
# }

# BAUL_REEMBOLSO() {
#   TITULO "Baul de Reembolso"
#   echo "abrir menu de baul reembolso"
#   adb shell input tap 520 1300
#   sleep 1s
#   echo "tomar recompensa"
#   adb shell input tap 770 520
#   sleep 2.5s
#   adb shell input tap 770 520
#   sleep 1s
#   echo "cerrar modal"
#   adb shell input tap 520 1900
#   sleep 1s
# }

# SUPER_TARJETA() {
#   TITULO "Super Tarjeta"
#   echo "abrir menu de super tarjeta"
#   adb shell input tap 500 1500
#   sleep 1s
#   echo "tomar recompensa"
#   adb shell input tap 770 470
#   sleep 2.5s
#   adb shell input tap 770 470
#   sleep 1s
#   echo "cerrar modal"
#   adb shell input tap 520 1900
#   sleep 1s
# }

COMPARTIR() {
  TITULO "Compartir"
  echo "abrir menu de compartir juego"
  adb shell input tap 80 1400
  sleep 0.5s
  echo "compartir con discord"
  adb shell input tap 340 1480
  sleep 0.5s
  echo "cerrar navegador"
  adb shell am force-stop com.brave.browser
  adb shell am force-stop com.discord
  sleep 0.5s
  echo "recibir gemas de discord"
  adb shell input tap 300 1350
  sleep 2.5s
  adb shell input tap 300 1350
  echo "cerrar modal"
  adb shell input tap 520 2140
  sleep 1s
}

MISIONES() {
  TITULO "Misiones"
  echo "ir a la seccion de misiones"
  adb shell input tap 80 550
  sleep 1s

  echo "recibir regalos"
  for i in {1..4}
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

# MISIONES_EVENTO() {
#   TITULO "Misiones del Evento"
#   echo "ir a la seccion de misiones"
#   adb shell input tap $1 $2
#   sleep 1s
#   adb shell input tap 90 2180
#   sleep 1s
  
#   echo "recibir regalos"
  
#   for i in {1..6}
#   do
#     adb shell input tap 730 1300
#     adb shell input tap 730 1480
#     adb shell input tap 730 1650
#     sleep 2s
#     adb shell input tap 730 1300
#     sleep 1s
#   done

#   echo "salir de la seccion de misiones"
#   adb shell input tap 520 1980
#   sleep 1s
#   adb shell input tap 930 2180
#   sleep 1s
# }

# MISIONES_EVENTO_2() {
#   TITULO "Misiones del Evento"
#   echo "ir a la seccion de misiones"
#   adb shell input tap $1 $2
#   sleep 1s
#   adb shell input tap 90 2180
#   sleep 1s
  
#   echo "recibir regalos"
  
#   for i in {1..4}
#   do
#     adb shell input tap 730 1160
#     adb shell input tap 730 1330
#     adb shell input tap 730 1510
#     adb shell input tap 730 1690
#     sleep 2s
#     adb shell input tap 730 1690
#     sleep 1s
#   done

#   echo "salir de la seccion de misiones"
#   adb shell input tap 520 1980
#   sleep 1s
#   adb shell input tap 930 2180
#   sleep 1s
# }

MINERO() {
  TITULO "Minero"

  if [[ $1 = "full" ]]; then
    echo "ir a la mina"
    adb shell input tap 190 760
    sleep 1s
  fi

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

  for t in {1..20}
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

  if [[ $1 = "full" ]]; then
    sleep 1s
    echo "salir de la mina"
    adb shell input tap 920 2100
    sleep 1s
  fi
}
# ------------------------------------------- inicio

MENU_PRINCIPAL() {
  echo "abrir menu principal"
  adb shell input tap 80 172
  sleep 1s
  CORREO
  AMIGOS
  COMPARTIR
  # echo "salir del menu principal"
  # adb shell input tap 900 50
  # sleep 1s
}

LUCHA() {
  echo "abrir seccion de lucha"
  adb shell input tap 430 2180
  sleep 1s
  echo "navegar hacia arriba del menu de lucha"
  adb shell input swipe 520 800 520 2200 100
  sleep 1s
  LAMPARA_MAGICA
  RUINAS_LLAMAS
  echo "navegar a la seccion de ciudad antigua"
  adb shell input swipe 520 1930 520 1000 2000
  sleep 1s
  CIUDAD_ANTIGUA
  TORRE_CRONOLOGICA
  SANTUARIO
  # PROVOCACION
  echo "cerrar menu de lucha"
  adb shell input tap 430 2180
  sleep 1s
}

TORRE() {
  echo "ir a la torre"
  adb shell input tap 610 2180
  sleep 1s
  # MINERO "full"
  # RESIDENCIA_SEGUIDORES
  # ESTACIONAMIENTO
  HACIENDA
  OFICIANTE
  echo "salir de la torre"
  adb shell input tap 610 2180
  sleep 1s
}

CLAN() {
  echo "ir a la isla del clan"
  adb shell input tap 800 2180
  sleep 1s
  echo "navegar hasta abajo"
  adb shell input swipe 520 10 520 2100 7000
  SALON
  # PEZ
  echo "salir de la isla del clan"
  adb shell input tap 800 2180
  sleep 2.5s
}

# RECARGAS() {
#   echo "abrir seccion de presentes de recarga"
#   adb shell input tap 80 470
#   sleep 1s
#   # CONTRA_ATAQUE
#   TARJETA_PRIVILEGIOS
#   echo "navegar a evento"
#   adb shell input tap 770 1600
#   sleep 1s
#   echo "navegar hacia arriba del menu de lucha"
#   adb shell input swipe 520 830 520 2200 100
#   sleep 1s
#   ESCALERAS_CRECIMIENTO
#   OFERTAS_DIARIAS
#   # BAUL_REEMBOLSO
#   SUPER_TARJETA
#   echo "salir de la seccion de recarga"
#   adb shell input tap 520 1800
#   sleep 1s
# }

# ARTES_MARCIALES() {
#   TITULO "Artes Marciales"
#   echo "abrir seccion de artes marciales"
#   adb shell input tap $1 $2
#   sleep 1s
#   echo "tomar recompensa"
#   adb shell input tap 500 2000
#   sleep 2s
#   adb shell input tap 500 2000
#   sleep 1s
#   echo "salir de la seccion de artes marciales"
#   adb shell input tap 900 2170
#   sleep 1s
# }

CARTAS() {
  XX=(
    170
    360
    600
    820
  )

  YY=(
    950
    1200
    1460
    1670
    1900
  )

  for j in "${YY[@]}"
  do
    for i in "${XX[@]}"
    do
      adb shell input tap $i $j
    done
  done
}

CAMBIAR_USUARIO() {
  TITULO "Cambiar de Usuario"
  adb shell input tap 80 150
  sleep 1s
  adb shell input tap 180 500
  sleep 1s
  adb shell input tap 730 1380
  sleep 1s
  adb shell input tap 760 1070
  sleep 1s
  adb shell input tap 520 1385
  sleep 1s
  adb shell input tap 520 1200
  # adb shell input swipe 520 10 520 2100 7000
}

COMENZAR() {
  clear

  TITULO $1

  adb shell am force-stop com.whatsapp
  sleep 15s

  adb shell input tap 660 1590
  adb shell input tap 660 1590
  sleep 2s
  adb shell input tap 660 1590
  sleep 1

  for t in {1..5}
  do
    adb shell input tap 520 20
    sleep 1s
  done

  RUTA="/sdcard/LOM/${1}_$(date +'%Y%m%d_%H%M%S')"
  adb shell screencap -p "${RUTA}.png"
  # adb shell screenrecord --time-limit=5 "${RUTA}.mp4"
}

RECIBIR() {
  PERFILES=(
    "kolombo"
    "bruno"
    "koturno"
  )

  for u in "${PERFILES[@]}"
  do
    COMENZAR $u

    CLAN
    LUCHA
    TORRE

    MENU_PRINCIPAL
    TIENDA
    ALMA_MARCIAL
    # MISIONES

    CAMBIAR_USUARIO
  done
}

RECIBIR

# TEST() {
#   adb shell input swipe 870 1900 10 1900 10
#   adb shell input swipe 870 1900 10 1900 10
#   adb shell input swipe 870 1900 10 1900 10
#   sleep 2.25s
#   adb shell input tap 870 1900
#   # adb shell input tap 580 1900
#   sleep 0.1s
#   adb shell input tap 720 1710
#   sleep 0.1s
#   adb shell input tap 500 1250
# }
# TEST

# ------------------------------------ Patos
# Nira
# Noe
# Nati
# Nazif

# - Ponto Vital
# - Velocidade Proibida
# - Antena para raios
# - Explosao de natureza

# Anyi
# Akif
# Ali
# Angel
# Anika

# - Super Liga
# - Ataque Abragante
# - Velocidade Proibida
# - Ponto Vital
# - Explosao de natureza
# - Antena para raios

# Mika
# Momo
# Mikel

# - Univeso Explosivo
# - Explosao Infinita
# - Velocidade Proibida
# - Explosao de natureza
# - Ponto Vital
# - Antena para raios

# Gael
# Gali
# Gara
# Gari

# - Controle Reverso
# - Controle Total
# - Antena para raios
# - Ponto Vital
# - Explosao de natureza
# - Velocidade Proibida

# Cana
# Charo