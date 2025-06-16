*** Settings ***
Resource   env.resource

Library    Browser

*** Keywords ***
Start Session
    New Browser    browser=${BROWSER}    headless=${False}
    New Page       ${BASE_URL}