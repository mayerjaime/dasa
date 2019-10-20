#language: pt
@equipamento
Funcionalidade: Realizar cadastro de equipamento
Como um usuário do sistema
Eu quero realizar as requisições na API
A fim de realizar cadastro de um equipamento

@cadastro-equip-sucesso
Cenário: Cadastrar um equipamento com sucesso
    Quando executo a chamada no servico de equipamentos informando um protocolo "valido"
    Então devo receber o codigo 200
    E recebo a mensagem de sucesso.

@cadastro-equip-protocol-invalido
Cenário: Cadastrar um equipamento com protocolo invalido
    Quando executo a chamada no servico de equipamentos informando um protocolo "invalido"
    Então devo receber o codigo 409
    E a mensagem de protocolo nao suportado.
