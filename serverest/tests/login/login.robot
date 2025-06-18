*** Settings ***
Documentation    Elementos e ações na pagina de login

Library    Browser

Resource    ../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot


*** Test Cases ***
Execute login
    [Documentation]    Executa o login na pagina de login
    [Tags]    smoke
    Open Login Page
    Input Email
    Input Password
    Click Login Button
    Check Login Success