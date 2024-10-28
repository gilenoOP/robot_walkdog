*** Settings ***
Documentation        Tela de homepage

Library     Browser
Resource       ../resources/fixtures/env.resource

*** Test Cases ***
Validate Homepage
    New Browser                browser=${BROWSER}    headless=False
    New Page    https://walkdog.vercel.app
    Wait For Elements State    css=a[href="/signup"] strong    visible
    Get Text    css=a[href="/signup"] strong    equal    Quero ser Dog Walker