*** Settings ***

Documentation        Tela de cadastro de dog walker

Resource        ../resources/base.resource

*** Test Cases ***
Realizar cadastro
    [Tags]    success
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

Realizar cadastro sem preencher campos obrigatórios
    [Tags]    required
    Start session
    Go to signup page
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto 
    Finish session

Realizar cadastro com CPF incorreto
    [Tags]    cpf_inv
    ${dog_walker}    Create Dictionary
    ...    name=Gileno Oliveira
    ...    email=gileno.teste@gmail.com
    ...    cpf=0000001414541
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
    Alert should be    CPF inválido
    Finish session