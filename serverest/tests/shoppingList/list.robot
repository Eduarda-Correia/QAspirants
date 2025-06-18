*** Settings ***
Documentation    Ações para o fluxo de carrinho/lista de compras

Resource    ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
CT01 - Add product to cart    #Adicionar produto ao carrinho
    [Tags]    Positivo    list

    #primeiro a criação de um usuário válido

    ${random}    Generate Random String    8

    ${user}    Create Dictionary    
    ...    name=Maria Eduarda    
    ...    email=mariateste${random}@gmail.com    
    ...    password=123456
    
    Go to signup
    Submit signup form    ${user}
    User should be logged in      ${user}[name]
    Sleep    5
    
    #como ao cadastrar já loga automaticamente, podemos partir para a lista de produtos

    Add First Two Products to Cart

