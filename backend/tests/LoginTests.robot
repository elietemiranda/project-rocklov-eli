*** Settings ***
Documentation    Sessions route tests

Resource    ${EXECDIR}/resources/Base.robot

*** Test Cases ***

User Login
    [tags]      CT1

    &{payload}    Create Dictionary          
    ...           email=eliete@eliete.com    
    ...           password=123456

    ${response}         POST Login      ${payload}
    Status Should Be    200             ${response}

    ${token}            Set Variable    ${response.json()}[user_token]
    Length Should Be    ${token}        24

Incorrect password

    &{payload}    Create Dictionary          
    ...           email=eliete@eliete.com    
    ...           password=ABC123

    ${response}         POST Login     ${payload}
    Status Should Be    401            ${response}

    Should Be Equal    Unauthorized    ${response.json()}[error]

User Not Found

    &{payload}    Create Dictionary         
    ...           email=eliete@gmail.com    
    ...           password=abc123

    ${response}         POST Login      ${payload}
    Status Should Be    401             ${response}

    Should Be Equal    Unauthorized     ${response.json()}[error]

Wrong Email

    &{payload}    Create Dictionary         
    ...           email=eliete&gmail.com    
    ...           password=abc123

    ${response}         POST Login      ${payload}
    Status Should Be    412             ${response}

    Should Be Equal    wrong email      ${response.json()}[error]


EMPTY Email

    &{payload}    Create Dictionary    
    ...           email=${EMPTY}       
    ...           password=abc123

    ${response}         POST Login          ${payload} 
    Status Should Be    412                 ${response}

    Should Be Equal     required email      ${response.json()}[error]

EMPTY Password

    &{payload}    Create Dictionary          
    ...           email=eliete@eliete.com    
    ...           password=${EMPTY}

    ${response}         POST Login          ${payload}
    Status Should Be    412                 ${response}

    Should Be Equal     required password   ${response.json()}[error]

Without Email

    &{payload}    Create Dictionary    
    ...           password=abc123

    ${response}         POST Login          ${payload}
    Status Should Be    412                 ${response}

    Should Be Equal     required email      ${response.json()}[error]

Without Password

    &{payload}    Create Dictionary          
    ...           email=eliete@eliete.com    

    ${response}         POST Login              ${payload}
    Status Should Be    412                     ${response}

    Should Be Equal     required password       ${response.json()}[error]