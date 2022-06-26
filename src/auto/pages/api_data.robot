*** Settings ***
Documentation        Aqui estarão presentes todos os elementos usados nos testes de automação API.

Resource             ../../config/package.robot

*** Variables ***
&{BODY_BOOK}
...                    id=${AUTH.ID}
...                    title=${AUTH.TITLE}
...                    description=${AUTH.DESCRIPTION}
...                    pageCount=${AUTH.PAGECOUNT}
...                    excerpt=${AUTH.EXCERPT}
...                    publishDate=${AUTH.PUBLISHDATE}