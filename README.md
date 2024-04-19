# webrecon-NPP
Scripts utilizados para reconhecimento via WEB, melhorias do curso Novo Pentest Profissional.

Scripts que podem ajudar em varreduras via WEB.


dirb URL /usr/share/dirb/wordlists/small.txt -a "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"

gobuster dir -u URL -w /usr/share/wordlists/dirb/small.txt 

nikto -h URL

gobuster dir -u URL -w /usr/share/dirb/wordlists/big.txt -e -t 100 -r --no-error -o arquivos -x php,bkp,old,txt,xml -a "fake"

whatweb URL 
