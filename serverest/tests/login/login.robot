*** Settings ***
Documentation        Cenários de testes do cadastro de usuários
Library              FakerLibrary

Resource             ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Should login a user
    &{user}        Create Dictionary
    ...            nome=Jose J
    ...            email=jose@gmail.com
    ...            password=pdw123
    
    