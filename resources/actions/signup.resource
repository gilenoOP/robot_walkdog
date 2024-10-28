*** Settings ***
Documentation        Ações, steps e elementos da funcionalidade de cadastro
Library        Browser

# Isso não é uma Page Objects. É uma Custom Actions.
# No Page Objects o encapsulamento e a organização são feitas por páginas e no Custom Actions o encapsulamento e a organização são feitas por funcionalidades

*** Keywords ***
Go to signup page
    Click                      css=a[href="/signup"]
    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1    equal      Faça seu cadastro
    
Fill signup form
    [Arguments]    ${dog_walker}
    Wait For Elements State    form h1    visible      2000
    Get Text                   form h1    equal        Faça seu cadastro
    Fill Text                  css=input[name="name"]               ${dog_walker}[name]
    Fill Text                  css=input[name="email"]              ${dog_walker}[email]
    Fill Text                  css=input[name="cpf"]                ${dog_walker}[cpf]
    Fill Text                  css=input[name="cep"]                ${dog_walker}[cep]
    Click                      css=input[value="Buscar CEP"]
    Get Text                   css=input[name="addressDistrict"]    equal    ${dog_walker}[district]
    Get Text                   css=input[name="addressCityUf"]      equal    ${dog_walker}[city_uf]
    Fill Text                  css=input[name="addressNumber"]      ${dog_walker}[number]
    Fill Text                  css=input[name="addressDetails"]     ${dog_walker}[details]
    Upload File By Selector    input[type=file]                     ${EXECDIR}/resources/fixtures/${dog_walker}[doc_image]

Click on the service button
    [Arguments]    @{services}
    FOR    ${service}    IN    @{services}
        Click    xpath=//span[text()="${service}"]/..
    END

Click on the Train button
    Click    css=img[alt=Adestrar]
Submit signup form
    Take Screenshot    fullPage=True
    Click                      text=Cadastrar

Alert should be
    [Arguments]    ${expected_alert_text}
    Wait For Elements State    css=.alert-error >> text=${expected_alert_text}    visible    5
    Wait For Elements State    css=.alert-error >> text=${expected_alert_text}    visible    5
    Wait For Elements State    css=.alert-error >> text=${expected_alert_text}    visible    5
    Wait For Elements State    css=.alert-error >> text=${expected_alert_text}    visible    5
    Wait For Elements State    css=.alert-error >> text=${expected_alert_text}    visible    5
    Wait For Elements State    css=.alert-error >> text=${expected_alert_text}    visible    5

Popup should be
    [Arguments]    ${expected_popup_text}
    Wait For Elements State    css=#swal2-html-container    visible      2000
    Get Text                   css=#swal2-html-container    equal        ${expected_popup_text}
    Click                      css=.swal2-confirm

Validate access to the signup form page
    [Arguments]    ${expected_registration_text}
    Wait For Elements State    h1    visible    2000
    Get Text                   h1    equal      ${expected_registration_text}
    Click                      text="Quero ser Dog Walker"

Validate return to registration form page
    [Arguments]    ${expected_form_text}
    Wait For Elements State    form h1    visible    2000
    Get Text                   form h1    equal      ${expected_form_text}