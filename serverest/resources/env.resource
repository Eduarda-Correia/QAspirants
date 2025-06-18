*** Settings ***
Documentation    Variaveis globais e configurações de ambiente

*** Variables ***
${BASE_URL}    https://compassuolfront.serverest.dev
${BROWSER}     chromium

${INPUT_NAME}            css=input[data-testid=nome]
${INPUT_EMAIL}           css=input[data-testid=email]
${INPUT_PASSWORD}        css=input[data-testid=password]
${INPUT_PASSWORD_LOGIN}  css=input[data-testid=senha]
${CHECKBOX_ADMIN}        css=input[data-testid=checkbox]
${BUTTON_SIGNUP}         css=button[data-testid=cadastrar]
${BUTTON_LOGIN}          css=button[data-testid=entrar]
${BUTTON_LIST_USERS}     css=a[data-testid=listarUsuarios]
${HEADER_WELCOME}        css=.jumbotron h1