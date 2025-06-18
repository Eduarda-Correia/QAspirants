*** Settings ***
Documentation        Elementos e ações na home

Library              Browser

Resource             ../env.resource

*** Keywords ***
Open users list
    Click    css=button[data-testid=listarUsuarios]