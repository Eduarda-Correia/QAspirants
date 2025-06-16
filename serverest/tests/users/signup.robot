*** Settings ***
Documentation        Cenários de testes do cadastro de usuários
Library              FakerLibrary

Resource             ../../resources/base.resource
Resource             ../../resources/pages/SignupPage.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Should signup a new user
    &{user}        Create Dictionary    
    ...            nome=FakerLibrary
    ...            email=ci@gmail.com
    ...            password=pwe123
    
    ${id}    Set Test Variable    ${id}
    Go to signup Page
    Submit signup form as administrator    &{user}
    Administrator should be logged in      ${user}[nome]