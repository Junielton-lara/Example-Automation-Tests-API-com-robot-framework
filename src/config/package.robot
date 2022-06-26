*** Settings ***
Documentation        Este será o nosso gerenciador de dependências.

Library              SeleniumLibrary
Library              RequestsLibrary
Library              Collections
Library              DebugLibrary

###########################
#         Keywords        #
###########################

Resource        ../auto/keywords/kws_api.robot

###########################
#         Pages        #
###########################

Resource       ../auto/pages/api_data.robot


###########################
#          Config         #
###########################

Resource        hooks.robot
Variables       ../auto/data/web/datamass_register.yml
Variables       ../auto/data/api/datamass_api.yml
Variables       hooks.yml