#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
    echo "Extensoes: pdf,doc,docx,xls,xlsx,ppt,pptx"
    echo "Modo de uso: $0 target.com pdf"
else
    lynx_output=$(lynx --dump "https://google.com/search?q=site:$1+ext:$2" | grep ".$2" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' | grep -v /search)
    if [ -z "$lynx_output" ]; then
        echo "Nenhuma URL encontrada com a extensão .$2 para o site $1."
    else
        count=1
        echo "URLs encontradas com a extensão .$2 para o site $1:"
        while IFS= read -r line; do
            echo "$count: $line"
            count=$((count+1))
        done <<< "$lynx_output"
    fi
fi
