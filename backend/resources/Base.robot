*** Settings ***

Library     RequestsLibrary

Resource    ${EXECDIR}/resources/routes/Sessions.robot

*** Variables ***
${base_url}         https://rocklov-eli-api.herokuapp.com