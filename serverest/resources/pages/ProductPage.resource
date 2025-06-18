*** Settings ***
Documentation        Elementos e ações na pagina de cadastro

Library              Browser
Library              FakerLibrary

Resource             ../env.resource

*** Keywords ***
Go to products Page
    Go To    ${BASE_URL}/admin/cadastrarprodutos
    Wait For Elements State    xpath=//h1[contains(text(), 'Cadastro de Produtos')]    visible    10
    Get Text    xpath=//h1[contains(text(), 'Cadastro de Produtos')]    equal    Cadastro de Produtos

Go to ListProducts Page
    Go To    ${BASE_URL}/admin/listarprodutos
    Wait For Elements State    xpath=//h1[contains(text(), 'Lista dos Produtos')]    visible    10
    Get Text    xpath=//h1[contains(text(), 'Lista dos Produtos')]    equal    Lista dos Produtos


Submit products form
    [Arguments]    &{product}


    Fill Text    css=input[name="nome"]        ${product}[nome]
    Fill Text    css=input[name="price"]       ${product}[preco]
    Fill Text    css=#description              ${product}[descricao]
    Fill Text    css=#quantity                 ${product}[quantidade]
    
    Click        xpath=//button[text()='Cadastrar']


Product should be listed
    [Arguments]    ${product_name}
    Get Text    xpath=//table[contains(@class,'table-striped')]//td[normalize-space(text())="${product_name}"]    ==    ${product_name}










