*** Settings ***
Documentation        Elementos e ações na pagina de login

Library              Browser

Resource             ../base.resource

*** Keywords ***
Submit login form
    [Arguments]    &{user}

    Fill Text    css=input[data-testid=email]        ${user}[email]
    Fill Text    css=input[data-testid=password]     ${user}[password]

    Click        css=button[data-testid=entrar]
