# Crio a variavel PAYLOAD do tipo Dictionary
# A Library RequestsLibrary fará a conversáo para JSON
# A variavel RESPONSE pega o resultado da requisicao POST (Status code se está retornando 200), no entanto ela somente guarda essa informacao
# O teste que confirma se realmente o status code está correto é na kewyword Status Should Be 200 ${response}
# ... define que é multiline
# KW Set Variable retornar o valor do user_token na variavel token
# 6199b2898b3f370016de0455 - 24 caracteres
# Length Should Be confirma se a qtd de caracteres do token é 24
# Teste Incorrect Password - HTTPError: 401 Client Error: Unauthorized for url: https://rocklov-eli-api.herokuapp.com/sessions
# A KW POST por padrao apresenta falha qd o status code é diferente de 200, daí coloca-se o parametro expected_status = ...para ignorar o comportamento
# EMPTY - a library vai entender q será montado um payload com a variavel EMPTY, passando o email em branco
# CRIANDO A base para reaproveitar a URL da api em outras suites de testes
# ${EXECDIR} pega o caminho absoluto de onde a pasta se encontra
# Melhorando o código do POST, criando routes->Sessions.robot
# a SUITE LOGINTTESTES.ROBOT importa o arquivo BASE.ROBOT, entao há um conceito de HERANCA, pq ele herda as routes para usar em outras suites de testes
# [Arguments]   ${payload} (todos os valores constantes no payload, no caso aqui email e senha)
# qd se faz um POST, precisamos de um RETORNO do json q é devolvido na requisicao
# usamos a palavra RESERVADA [return] e pegamos o retorno da RESPONSE
