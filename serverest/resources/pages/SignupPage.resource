*** Settings ***
Documentation        Elementos e ações na pagina de cadastro

Library              Browser
Library              FakerLibrary

Resource             ../env.resource

*** Keywords ***
Go to signup Page
    Go To    ${BASE_URL}/cadastrarusuarios
    Wait For Elements State    xpath=//h2    visible    5
    Get Text                   xpath=//h2    equal      Cadastro

Submit signup form as administrator
    [Arguments]    &{user}


    Fill Text    css=input[data-testid=nome]        ${user}[nome]
    Fill Text    css=input[data-testid=email]       ${user}[email]
    Fill Text    css=input[data-testid=password]    ${user}[password]
    
    Click        css=input[data-testid=checkbox]

    Click        css=button[data-testid=cadastrar]

Submit signup form as user
    [Arguments]    &{user}

    Fill Text    css=input[data-testid=nome]        ${user}[nome]
    Fill Text    css=input[data-testid=email]       ${user}[email]
    Fill Text    css=input[data-testid=password]    ${user}[password]
    
    Click        css=button[data-testid=cadastrar]