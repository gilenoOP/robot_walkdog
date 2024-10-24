*** Settings ***

Documentation        Tela de cadastro de dog walker

Resource        ../resources/base.resource

*** Test Cases ***
Realizar cadastro
    ${dog_walker}    Create Dictionary
    ...    name=Gileno Oliveira
    ...    email=gileno.teste@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    number=1183
    ...    details=Apto 121
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    doc_image=Goku.jpeg

    Start session
    Go to signup page
    Fill signup form                           ${dog_walker}
    Submit signup form
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
    Validate access to the signup form page    Cuidado e diversão em cada passo
    Validate return to registration form page  Faça seu cadastro
    Finish session