*** Settings ***
Documentation    Elementos e ações usadas para usar no teste de Listagem de produtos

Library    Browser

Resource    ../env.resource
Resource    ../../resources/base.resource

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

    Click    xpath=(//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')])[1]//button[@data-testid='adicionarNaLista']
    Sleep    1

    Go To    ${BASE_URL}/home
    Sleep    1

    Wait For Elements State    xpath=(//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')])[2]//button[@data-testid='adicionarNaLista']    visible    timeout=15s
    Click    xpath=(//div[contains(@class, 'container-fluid')]//div[contains(@class, 'card') and contains(@class, 'col-3')])[2]//button[@data-testid='adicionarNaLista']
    Sleep    1

Clear Product List    # Limpa toda a lista de compras

    Go To    ${BASE_URL}/minhaListaDeProdutos

    Wait For Elements State    xpath=//button[@data-testid='limparLista']    visible    timeout=10
    
    Click    xpath=//button[@data-testid='limparLista']
    Sleep    0.5s