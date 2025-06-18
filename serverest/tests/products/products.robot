*** Settings ***
Documentation    Elementos e ações na pagina de produtos
Library          Browser
Library          FakerLibrary

Resource         ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Registering a new product
    [Tags]          POST    Product    Positivo
    
    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable        pwd123

    ${user}        Create Dictionary    
    ...            nome=${name}
    ...            email=${email}
    ...            password=${password}
    
    Go to signup Page
    Submit signup form as administrator    ${user}
    Administrator should be logged in      ${user}[nome]
    Go to products Page
    
    ${name_product}        FakerLibrary.Word
    ${price}               FakerLibrary.Random Number    1    1000
    ${description}         FakerLibrary.Sentence
    ${quantity}            FakerLibrary.Random Number    1    100

    ${product}    Create Dictionary
    ...            nome=${name_product}
    ...            preco=${price}
    ...            descricao=${description}
    ...            quantidade=${quantity}

    Submit products form    &{product}
    Sleep    5

    ${product_name}=    Set Variable    ${product}[nome]
    Product should be listed    ${product_name}
Listing products on the products page
    [Tags]          GET    Product    Positivo

    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable    pwd123

    ${user}    Create Dictionary
    ...        nome=${name}
    ...        email=${email}
    ...        password=${password}

    Go to signup Page
    Submit signup form as administrator    ${user}
    Administrator should be logged in      ${user}[nome]

    Go to ListProducts Page

    ${produtos}=    Get Elements    xpath=//table[contains(@class,'table-striped')]//tbody//tr/td[1]
    Log    Lista de produtos encontrados:

    FOR    ${produto}    IN    @{produtos}
        ${nome}=    Get Text    ${produto}
    END

    Should Not Be Empty    ${produtos}    Nenhum produto foi listado na página.

Product excluded
    [Tags]          DELETE    Product    Positivo
    ${name}         FakerLibrary.Name
    ${email}        FakerLibrary.Free Email
    ${password}     Set Variable        pwd123

    ${user}        Create Dictionary    
    ...            nome=${name}
    ...            email=${email}
    ...            password=${password}
    
    Go to signup Page
    Submit signup form as administrator    ${user}
    Administrator should be logged in      ${user}[nome]
    Go to products Page
    
    ${name_product}        FakerLibrary.Word
    ${price}               FakerLibrary.Random Number    1    1000
    ${description}         FakerLibrary.Sentence
    ${quantity}            FakerLibrary.Random Number    1    100

    ${product}    Create Dictionary
    ...            nome=${name_product}
    ...            preco=${price}
    ...            descricao=${description}
    ...            quantidade=${quantity}

    Submit products form    &{product}
    Sleep    5

    ${product_name}=    Set Variable    ${product}[nome]
    Product should be listed            ${product_name}
    Click    xpath=//td[normalize-space(text())="${product_name}"]/following-sibling::td//button[contains(@class, 'btn-danger')]