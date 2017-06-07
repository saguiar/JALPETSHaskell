# Cliente :grinning:

## Adicionar cliente 

    curl -X POST http://node23.codenvy.io:53581/cliente -d '{"nome":"", "telefone": "", "sexo":"M", "email":""}'
    
    Sucesso: 201 created 
    
    Resposta: {"resp":5}
    
## Alterar cliente

    curl -X PUT http://node23.codenvy.io:53581/cliente/1 -d '{"nome":"", "telefone": "", "sexo":"F", "email":""}'
    
    Sucesso: 200 ok
    
    Resposta: {"resp":1}

## Deletar cliente

    curl -X DELETE http://node23.codenvy.io:53581/cliente/5
    
    Sucesso: no content 204

    Resposta: vazio
    
## Listar clientes

    curl -X GET http://node23.codenvy.io:53581/cliente
    
    Sucesso: 200 ok
    
    Resposta: {["nome":"", "telefone": "", "sexo":"F", "email":"", "nome":"", "telefone": "", "sexo":"F", "email":""]}
    
# Produto :paw_prints:

## Adicionar produto 

    curl -X POST http://node23.codenvy.io:53581/produto -d '{"nome"":"", "preço": "", "fabricante":"", "validade":""}'
    
    Sucesso: 201 created
    
    Resposta: {"resp": 2}
    
## Alterar produto 

    curl -X PUT http://node23.codenvy.io:53581/produto/2 -d '{"nome"":"", "preço": "", "fabricante":"", "validade":""}'
    
    Sucesso: 200 ok
    
    Resposta: {"resp":2}
    
## Deletar produto 

    curl -X DELETE 	http://node23.codenvy.io:53581/produto/3
    
    Sucesso: no content 204
    
    Resposta: vazio
    
## Listar produtos

    curl -X GET http://node23.codenvy.io:53581/produto
    
    Sucesso: 200 ok
    
    Resposta: {["nome"":"", "preço": "", "fabricante":"", "validade":"", "nome"":"", "preço": "", "fabricante":"", "validade":""]}
    
# Serviço :shower:
    
## Adicionar servico

    curl -X POST http://node23.codenvy.io:53581/servico -d '{"nome"":"", "preço": ""}' 
    
    Sucesso: 201 created
    
    Resposta: {"resp":3}
    
## Alterar servico

    curl -X PUT http://node23.codenvy.io:53581/servico/1 -d '{"nome"":"", "preço": ""}'
    
    Sucesso: 200 ok
    
    Resposta: {"resp":1}
    
## Deletar servico
    
    curl -X DELETE 	http://node23.codenvy.io:53581/servico/2
    
    Sucesso: no content 204
    
    Resposta: vazio
    
## Listar servico

    curl -X GET http://node23.codenvy.io:53581/servico
    
    Sucesso: 200 ok
    
    Resposta: {["nome"":"", "preço": ", "nome"":"", "preço": "]}
    
# Agendamento :clock2:

## Adicionar agendamento

    curl -X POST http://node23.codenvy.io:53581/agendamento -d '{"data":"", "servico":"", "animal":""}'
    
    Sucesso: 201 created
    
    Resposta: {"resp":3}

## Alterar agendamento

    curl -X PUT -d '{"data":"", "servico":"", "animal":""}' 	http://node23.codenvy.io:53581/agendamento/2
    
    Sucesso: 200 ok
    
    Resposta: {"resp":2}
    
## Alterar agendamentos

    curl -X PATCH -d {[3600,"2016-12-07T03:55:20Z"]} 	http://node23.codenvy.io:53581/agendamentos
    
    Sucesso: 200 ok
    
    Resposta: No content

## Deletar agendamento

    curl -X DELETE 	http://node23.codenvy.io:53581/agendamento/3
    
    Sucesso: no content 204
    
    Resposta: vazio

## Listar agendamentos

    curl -X GET http://node23.codenvy.io:53581/agendamento
    
    Sucesso: 200 ok
    
    Resposta: {["data":"", "servico":"", "animal":"", "data":"", "servico":"", "animal":""]}
    
# Animal :dog:
     
## Adicionar animal

    curl -X POST http://node23.codenvy.io:53581/animal -d '{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}' 
    
    Sucesso: 201 created
    
    Resposta: {"resp":2}
    
## Alterar animal
    
    curl -X PUT http://node23.codenvy.io:53581/animal/2 -d '{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}'
    
    Sucesso: 200 ok
    
    Resposta: {"resp":2}
    
## Deletar animal

    curl -X DELETE 	http://node23.codenvy.io:53581/animal/3
    
    Sucesso: no content 204
    
    Resposta: vazio
    
## Listar animais

    curl -X GET http://node23.codenvy.io:53581/animal
    
    Sucesso: 200 ok
    
    Resposta: {[{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}, {"nome":"", "nascimento":"", "tipo":"", "clienteId":""}]}
    