*** Settings ***
<<<<<<< HEAD
Documentation        Cenários de testes do cadastro de usuários
Library              FakerLibrary

Resource             ../../resources/base.resource
=======
Documentation    Elementos e ações na pagina de login

Library    Browser

Resource    ../resources/base.resource
>>>>>>> 3bc153460422957c253af993f8d27a1700c831d3

Test Setup           Start Session
Test Teardown        Take Screenshot

<<<<<<< HEAD
*** Test Cases ***
Should login a user
    &{user}        Create Dictionary
    ...            nome=Jose J
    ...            email=jose@gmail.com
    ...            password=pdw123
    
    
=======

*** Test Cases ***
Execute login
    [Documentation]    Executa o login na pagina de login
    [Tags]    smoke
    Open Login Page
    Input Email
    Input Password
    Click Login Button
    Check Login Success
>>>>>>> 3bc153460422957c253af993f8d27a1700c831d3
