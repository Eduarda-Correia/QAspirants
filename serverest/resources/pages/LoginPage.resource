*** Settings ***
Library    Browser
Resource   ../env.resource
Resource    components/Header.resource

*** Keywords ***
Go to login Page
    Go To    ${BASE_URL}/login
    Wait For Elements State    css=form    visible    5

Login as Administrator
    [Arguments]    ${user}
    Go to login Page
    Submit login form    ${user}
    Administrator should be logged in    ${user['nome']}
Submit login form
    [Arguments]    ${user}
    Fill Text    ${INPUT_EMAIL}        ${user['email']}
    Fill Text    ${INPUT_PASSWORD_LOGIN}     ${user['password']}
    Click        ${BUTTON_LOGIN}

