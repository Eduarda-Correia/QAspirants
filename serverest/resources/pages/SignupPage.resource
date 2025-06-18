*** Settings ***
<<<<<<< HEAD
Library    Browser
Resource   ../env.resource
Resource    LoginPage.resource
=======
Documentation        Elementos e ações na pagina de cadastro

Library              Browser
Library              FakerLibrary

Resource             ../env.resource
>>>>>>> 3bc153460422957c253af993f8d27a1700c831d3

*** Keywords ***
Go to signup Page
    Go To    ${BASE_URL}/cadastrarusuarios
    Wait For Elements State    xpath=//h2    visible    5
    ${title}=    Get Text    xpath=//h2
    Should Be Equal    ${title}    Cadastro

Fill Signup Form
    [Arguments]  ${user}  ${is_admin}=False         
   
    Fill Text    ${INPUT_NAME}         ${user['nome']}
    Fill Text    ${INPUT_EMAIL}        ${user['email']}
    Fill Text    ${INPUT_PASSWORD}     ${user['password']}
    Run Keyword If    '${is_admin}'=='True'    Click    ${CHECKBOX_ADMIN}
    Click        ${BUTTON_SIGNUP}

Submit signup form as administrator
<<<<<<< HEAD
    [Arguments]    ${user}
    Fill Signup Form   ${user}     True
=======
    [Arguments]    &{user}


    Fill Text    css=input[data-testid=nome]        ${user}[nome]
    Fill Text    css=input[data-testid=email]       ${user}[email]
    Fill Text    css=input[data-testid=password]    ${user}[password]
    
    Click        css=input[data-testid=checkbox]

    Click        css=button[data-testid=cadastrar]
>>>>>>> 3bc153460422957c253af993f8d27a1700c831d3

Submit signup form as user
    [Arguments]    ${user}
    Fill Signup Form    ${user}    False