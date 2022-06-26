*** Settings ***
Documentation            Aqui estarão presentes os testes de API automatizados.

Resource                 ../../src/config/package.robot

Suite Setup              Conectar na minha API

*** Test Cases ***
Cenario: Buscar listagem de todos os livros (GET em todos os livros)
    FOR    ${counter}    IN RANGE    1    20
    # [Tags]                GET
    Dado que eu tenha o endpoint de consulta de livros
    Quando executar a requisição de consulta de todos
    Então deverá ser retornada uma lista com "200" livros
    E o status code     200
    Log    Get numero ${counter}
        
    END

Cenario: Buscar livros não cadastrado na base
    [Tags]                GET
    Dado que eu tenha o endpoint de consulta de livros
    Quando executar a requisição de consulta do livro        205
    E o status code     404
    E a mensagem "Not Found"

Cenario: Realizar cadastro de um novo livro
    [Tags]                POST
    Dado que eu tenha o endpoint de cadastro de livros
    Quando executar a requisição de cadastro de novo livro com as informações corretas
    Então a api deverá retornar o status code     200
    E o body com todas as informações enviadas no cadastro

Cenario: Realizar a consulta de livros
    Create Session        booksAPI            https://fakerestapi.azurewebsites.net/api/v1        disable_warnings=${True}
    ${HEADERS}            Create Dictionary        content-type=application/json
    Set Test Variable     ${HEADERS}

    ${RESPOSTA}           GET On Session      booksAPI        Books            expected_status=any
    Log                   ${RESPOSTA.text}
    Set Test Variable     ${RESPOSTA}

    Should Be Equal As Strings    ${RESPOSTA.status_code}        200
    Should Be Equal As Strings    ${RESPOSTA.reason}             OK