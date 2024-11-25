#!/bin/bash

echo -e "\e[35m
╔═══╗
║╔═╗║
║║─╚╬══╦═╗
║║╔═╣║═╣╔╗╗
║╚╩═║║═╣║║║
╚═══╩══╩╝╚╝
╔═══╗─────╔╗
║╔═╗║─────║║
║║─╚╬══╦╗╔╣╚═╦══╦══╗
║║─╔╣╔╗║╚╝║╔╗║╔╗║══╣
║╚═╝║╚╝║║║║╚╝║╚╝╠══║
╚═══╩══╩╩╩╩══╩══╩══╝\e[0m"

echo -e "\e[1;35mGenetador de Combos\e[0m"

# Función para generar un nombre latino aleatorio
generar_nombre_latino() {
    nombres=("Julia" "Emilio" "Lucia" "Mateo" "Camila" "Diego" "Valentina" "Santiago")
    echo "${nombres[$((RANDOM % ${#nombres[@]}))]}"
}

# Función para generar una contraseña aleatoria
generar_contrasena() {
    caracteres="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    longitud=8
    echo "$(head /dev/urandom | tr -dc "$caracteres" | head -c "$longitud")"
}

# Función para generar un combo usuario:contraseña
generar_combo() {
    usuario="$1"
    contrasena="$2"
    echo "${usuario}:${contrasena}"
}

# Función para generar combos
generar_combos() {
    num_combos=$1
    for ((i=1; i<=num_combos; i++)); do
        nombre=$(generar_nombre_latino)
        contrasena=$(generar_contrasena)
        combo=$(generar_combo "$nombre" "$contrasena")
        echo "$combo"
    done
}

# Función para guardar los combos en un archivo en la tarjeta SD
guardar_combos() {
    combos="$1"
    ruta="/sdcard/combos.txt"
    echo "$combos" > "$ruta"
    echo "Combos guardados en $ruta"
}

# Main
echo -n "¿Cuántos combos deseas generar? "
read num_combos
combos=$(generar_combos $num_combos)
guardar_combos "$combos"