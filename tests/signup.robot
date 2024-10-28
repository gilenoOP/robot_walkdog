*** Settings ***

Documentation        Tela de cadastro de dog walker

Resource        ../resources/base.resource

# hooks para cada teste
Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Realizar cadastro sem preencher campos obrigatórios
    [Tags]    required
    Go to signup page
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto

Realizar cadastro com CPF inválido
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

    Go to signup page
    Fill signup form                           ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido

Realizar cadastro com e-mail inválido
    [Tags]    cpf_inv
    ${dog_walker}    Create Dictionary
    ...    name=Tyson Wayne
    ...    email=wayne.ty.teste.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    number=1183
    ...    details=Apto 121
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    doc_image=Goku.jpeg

    Go to signup page
    Fill signup form                           ${dog_walker}
    Submit signup form
    Alert should be    Informe um email válido

Realizar cadastro sem serviços adicionais
    [Tags]    success
    ${dog_walker}    Create Dictionary
    ...    name=Cláudia Barreto
    ...    email=claudia.b@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    number=1183
    ...    details=Apto 121
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    doc_image=Goku.jpeg

    Go to signup page
    Fill signup form                           ${dog_walker}
    Submit signup form
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
    Validate access to the signup form page    Cuidado e diversão em cada passo
    Validate return to registration form page  Faça seu cadastro

Realizar cadastro de dog walker cuidador
    [Tags]    add_serv
    ${dog_walker}    Create Dictionary
    ...    name=Serafim Gouveia
    ...    email=serafim.gou@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    number=1183
    ...    details=Apto 121
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    doc_image=Goku.jpeg

    Go to signup page
    Fill signup form                           ${dog_walker}
    Click on the service button                Cuidar
    Submit signup form
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
    Validate access to the signup form page    Cuidado e diversão em cada passo
    Validate return to registration form page  Faça seu cadastro

Realizar cadastro de dog walker adestrador
    [Tags]    add_serv
    ${dog_walker}    Create Dictionary
    ...    name=Carlos França
    ...    email=carlosfn@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    number=1183
    ...    details=Apto 121
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    doc_image=Goku.jpeg

    Go to signup page
    Fill signup form                           ${dog_walker}
    Click on the service button                Adestrar
    Submit signup form
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
    Validate access to the signup form page    Cuidado e diversão em cada passo
    Validate return to registration form page  Faça seu cadastro

Realizar cadastro de dog walker cuidador e adestrador
    [Tags]    add_serv
    ${dog_walker}    Create Dictionary
    ...    name=Denise Fraga
    ...    email=d.fraga@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    number=1183
    ...    details=Apto 121
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    doc_image=Goku.jpeg

    Go to signup page
    Fill signup form                           ${dog_walker}
    Click on the service button                Cuidar    Adestrar
    Submit signup form
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
    Validate access to the signup form page    Cuidado e diversão em cada passo
    Validate return to registration form page  Faça seu cadastro