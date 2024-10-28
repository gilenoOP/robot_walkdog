*** Settings ***
Documentation        Arquivo principal do projeto

Library        Browser
Resource       fixtures/env.resource
Resource       actions/signup.resource

*** Keywords ***
Start session
    # As duas linhas abaixo seriam usadas no caso de rodar diretamente no webkit (simulando safari) ou fierefox diretamente pela linha de comando. No nosso caso, estamos utilizando a variável Browser no arquivo fixture/env.resource para indicar o browser.
    #New Browser                browser=webkit    headless=False
    #New Browser                browser=firefox    headless=False
    New Browser                browser=${BROWSER}    headless=False
    New Page                   https://walkdog.vercel.app
    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo    visible    5

Finish session
    Take Screenshot    fullPage=True