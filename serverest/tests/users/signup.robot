*** Settings ***
Documentation        Cenários de testes do cadastro de usuários
Library              FakerLibrary
Library              Browser

Resource             ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Should signup a new administrator
    
    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable        pwd123

    &{user}        Create Dictionary    
    ...            nome=${name}
    ...            email=${email}
    ...            password=${password}
    
    Go to signup Page
    Submit signup form as administrator    &{user}
    Administrator should be logged in      ${user}[nome]

Should signup a new user

    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable        pwd123

    &{user}        Create Dictionary    
    ...            nome=${name}
    ...            email=${email}
    ...            password=${password}
    
    Go to signup Page
    Submit signup form as user    &{user}
    Administrator should be logged in      ${user}[nome]