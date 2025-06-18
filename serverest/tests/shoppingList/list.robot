*** Settings ***
Documentation    Ações para o fluxo de carrinho/lista de compras

Resource    ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
CT01 - Add product to cart    #Adicionar produto ao carrinho
    [Tags]    Positivo    list

    ${random}    Generate Random String    8

    ${user}    Create Dictionary    
    ...    name=Maria Corr    
    ...    email=teste${random}@gmail.com    
    ...    password=123456
    
    Go to signup
    Submit signup form    ${user}
    User should be logged in      ${user}[name]
    Sleep    3

    Add First Two Products to Cart

CT02 - Remove last item from cart    #Remover o último item do carrinho
    [Tags]    Negativo    remove
    
    ${random}    Generate Random String    8

    ${user}    Create Dictionary    
    ...    name=Maria Corr    
    ...    email=teste${random}@gmail.com    
    ...    password=123456

    Go to signup
    Submit signup form    ${user}
    User should be logged in      ${user}[name]
    Sleep    3

    Add First Two Products to Cart

    Clear Product List

    Go To    ${BASE_URL}/minhaListaDeProdutos

    ${qtd}=    Get Element Count    xpath=//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')]
    Should Be Equal As Numbers    ${qtd}    0

