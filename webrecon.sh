#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Uso: $0 <URL> <extensão>"
    exit 1
fi

url=$1
extension=$2

# Definindo o user agent desejado
user_agent="Fake"

for palavra in $(cat lista.txt); do
    # Fazendo a requisição usando o user agent personalizado
    response=$(curl -s -o /dev/null -w "%{http_code}" -A "$user_agent" "$url/$palavra.$extension")
    if [ "$response" == "200" ]; then
        echo "Arquivo encontrado: $url/$palavra.$extension"
    fi

    # Fazendo a requisição para o diretório usando o user agent personalizado
    response=$(curl -s -o /dev/null -w "%{http_code}" -A "$user_agent" "$url/$palavra/")
    if [ "$response" == "200" ]; then
        echo "Diretório encontrado: $url/$palavra/"
    fi
done
