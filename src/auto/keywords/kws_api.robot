*** Settings ***
Documentation        Aqui estarão presentes todas as Keywords responsáveis pelo testes de API.

Resource             ../../config/package.robot

*** Keywords ***
Dado que eu tenha o endpoint de consulta de livros
    Log     https://fakerestapi.azurewebsites.net/api/v1/Books

Quando executar a requisição de consulta de todos
    ${RESPOSTA}            GET On Session        booksAPI        Books       expected_status=any
    Log                    ${RESPOSTA.text} 
    Set Test Variable      ${RESPOSTA}

Então deverá ser retornada uma lista com "${QTD_LIVROS}" livros
    Length Should Be       ${RESPOSTA.json()}    ${QTD_LIVROS}
        
E o status code    
    [Arguments]                   ${STATUS_CODE}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_CODE}

#--------------------------------------------------------------------------------------------------------
Quando executar a requisição de consulta do livro
    [Arguments]            ${ID_LIVRO}
    ${RESPOSTA}            GET On Session        booksAPI        Books/${ID_LIVRO}       expected_status=any
    Log                    ${RESPOSTA.text} 
    Set Test Variable      ${RESPOSTA}

E a mensagem "${ERROR_MESSAGE}"
    Dictionary Should Contain Item        ${RESPOSTA.json()}        title        ${ERROR_MESSAGE}

#-------------------------------------------------------------------------------------------------------
Dado que eu tenha o endpoint de cadastro de livros
    Log     https://fakerestapi.azurewebsites.net/api/v1/Books

Quando executar a requisição de cadastro de novo livro com as informações corretas
    ${RESPOSTA}            POST On Session        booksAPI        Books       expected_status=any    
    ...                    json=${BODY_BOOK}
    ...                    headers=${HEADERS}
    Set Test Variable      ${RESPOSTA}
Então a api deverá retornar o status code 
    [Arguments]            ${STATUS_CODE} 
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_CODE}
      
E o body com todas as informações enviadas no cadastro
    Dictionary Should Contain Item        ${RESPOSTA.json()}        id                 ${AUTH.ID}
    Dictionary Should Contain Item        ${RESPOSTA.json()}        title              ${AUTH.TITLE}
    Dictionary Should Contain Item        ${RESPOSTA.json()}        description        ${AUTH.DESCRIPTION}
    Dictionary Should Contain Item        ${RESPOSTA.json()}        pageCount          ${AUTH.PAGECOUNT}
    Dictionary Should Contain Item        ${RESPOSTA.json()}        excerpt            ${AUTH.EXCERPT}
    Dictionary Should Contain Item        ${RESPOSTA.json()}        publishDate        ${AUTH.PUBLISHDATE}