*** Settings ***
Documentation        Cenários de testes do cadastro de usuários
Library              FakerLibrary

Resource             ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Should signup a new administrator
    &{user}        Create Dictionary    
    ...            nome=Cassia Yumi
    ...            email=ci@gmail.com
    ...            password=pwe123
    
    Go to signup Page
    Submit signup form as administrator    &{user}
    Administrator should be logged in      ${user}[nome]

Should signup a new user
    &{user}        Create Dictionary    
    ...            nome=Jean
    ...            email=js@gmail.com
    ...            password=pdw123
    
    Go to signup Page
    Submit signup form as user    &{user}
    Administrator should be logged in      ${user}[nome]