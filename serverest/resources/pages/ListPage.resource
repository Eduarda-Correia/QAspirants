*** Settings ***
Documentation    Elementos e ações usadas para usar no teste de Listagem de produtos

Library    Browser

Resource    ../env.resource

*** Keywords ***
Submit signup form
    [Arguments]    ${user}

    Fill Text    css=input[data-testid=nome]        ${user}[name]
    Fill Text    css=input[data-testid=email]       ${user}[email]
    Fill Text    css=input[data-testid=password]    ${user}[password]
    
    Click        css=button[data-testid=cadastrar]

Go to signup
    Go To    ${BASE_URL}/cadastrarusuarios
    Wait For Elements State    xpath=//h2    visible    5
    Get Text                   xpath=//h2    equal      Cadastro

Add First Two Products to Cart    # Adicionar Primeiros Dois Produtos ao Carrinho

    Click    (//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')])[1]//button[@data-testid='adicionarNaLista']
    Sleep    0.5s
    Go To    https://compassuolfront.serverest.dev/home
    Wait For Elements State    (//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')])[2]//button[@data-testid='adicionarNaLista']    visible    timeout=15s
    Click    (//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')])[2]//button[@data-testid='adicionarNaLista']
    Sleep    0.5s

    #${cards}=    Get Element    css=.container-fluid .card.col-3
    #${first_card}=    Set Variable    ${cards[0]}
    #${second_card}=    Set Variable    ${cards[1]}

    #${first_link}=    Get Element    xpath=.//a[@data-testid="product-detail-link"]

