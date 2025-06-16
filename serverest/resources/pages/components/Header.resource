*** Settings ***
Documentation        Ações e elementos do cabeçalho do mark85

Library              Browser
Library              String

*** Keywords ***
Administrator should be logged in
    [Arguments]    ${name}

    ${element}    Set Variable    css=.jumbotron h1
    Wait For Elements State    ${element}
    ...                        visible    5
    
    Get Text   ${element}    equal    Bem Vindo ${name}
