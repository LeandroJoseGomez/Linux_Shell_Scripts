#!/bin/bash

# Mi primer script en Linux

# Colores del texto
RED="\e[31m"
BACKGROUND_BLUE='\e[44m'
RESET="\e[0m"

isExit=0 # Variable auxiliar para salir del bucle.

num1=0
num2=0
option=0

while [ $isExit == 0 ]; do
    date
    printf "${BACKGROUND_BLUE}Calculadora simple \n\n${RESET}"

    printf "1.Sumar     3.Multiplicar \n2.Restar    4.Dividir \n\n"

    read -p "Seleccione el número de la opción: " option

    read -p "Introduzca un número: " num1
    read -p "Introduzca otro número: " num2

    if [ $option == 1 ]; then
        printf "\nEl resultado es: "
        expr $num1 + $num2
    
    elif [ $option == 2 ]; then
        printf "\nEl resultado es: "
        expr $num1 - $num2
    
    elif [ $option == 3 ]; then
        result=$(echo "scale=4; $num1 * $num2" | bc) # Uso de bc para manejo de decimales
        printf "\nEl resultado es: $result\n"
    
    elif [ $option == 4 ]; then
        if [ $num2 != 0 ]; then # Validación de división por cero.
            result=$(echo "scale=2; $num1 / $num2" | bc)
            printf "\nEl resultado es: $result\n"
            
        else
            printf "${RED}NO SE PUEDE DIVIDIR ENTRE CERO \n${RESET}"
        fi
    else
        printf "${RED}NO SE ENCONTRÓ LA OPCIÓN ESPECIFICADA\n${RESET}"
        printf "Reiniciando..."
    fi
    
    printf "\n"
    read -p "Escriba el 0 para continuar: " isExit
    
    if  [ $isExit == 0 ]; then
        printf "Reiniciando..."
        sleep 2 # Pausa de 2 segundos.
        clear
    else
        printf "Saliendo..."
        sleep 2 # Pausa de 2 segundos.
        clear
    fi
done


