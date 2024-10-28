*** Settings ***
Documentation        Arquivo de variáveis

*** Variables ***
${BROWSER}        chromium

# Por padrão, populamos a variável ${BROWSER} como chromium, mas podemos alterar o navegador via linha de comando
# Ex.: robot -d  ./logs/ -v BROWSER:firefox tests/