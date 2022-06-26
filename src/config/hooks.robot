*** Settings ***
Documentation        Aqui estarão presentes todos os arquivos de inicialização e finalização dos testes.

Resource            package.robot

*** Keywords ***
Abrir navegador
    Open Browser                     about:blank            ${CONFIG.WEB.BROWSER_NAME}
    Go To                            ${CONFIG.WEB.BASE_URL}
    Maximize Browser Window
    Set Selenium Timeout             ${CONFIG.WEB.IMPLICITY_WAIT}



# Fechar navegador
#     Capture Page Screenshot
#     Close Browser

Conectar na minha API
    Create Session        booksAPI                 ${AUTH.BASE_URL}        disable_warnings=${True}
    ${HEADERS}            Create Dictionary        content-type=application/json
    Set Suite Variable     ${HEADERS}
    
