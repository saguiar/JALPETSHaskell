# Documentação Jalpets - Petshop

O nosso webservice, Jalpets, foi criado para o uso de petshops. Nele é possível gerenciar cadastro/alteração/exclusão de clientes,
produtos, serviços, agendamentos e animais. 

## Cliente :grinning:

### Adicionar cliente 

    curl -X POST http://node23.codenvy.io:53581/cliente -d '{"nome":"", "telefone": "", "sexo":"M", "email":""}'
    
    Para o adicionar um cliente, usamos o método POST. 
    Nele colocamos os dados cliente, telefone, sexo e email.
    O retorno correto deve ser resp: clienteId.
    
    Sucesso: 201 created 
    
    Resposta: {"resp":5}
    
### Alterar cliente

    curl -X PUT http://node23.codenvy.io:53581/cliente/1 -d '{"nome":"", "telefone": "", "sexo":"F", "email":""}'
    
    Para alterar os dados do cliente, é utilizado o método PUT, URL e o cliente Id. 
    Pode-se alterar nome, telefone, sexo e email.
    O retorno deve ser resp e o cliente Id.
    
    Sucesso: 200 ok
    
    Resposta: {"resp":1}

### Deletar cliente

    curl -X DELETE http://node23.codenvy.io:53581/cliente/5
    
    Para deletar um cliente, basta usar o método DELETE e na URL adicionar novamente o cliente Id.
    O retorno deve ser vazio.
    
    Sucesso: no content 204

    Resposta: vazio
    
### Listar clientes

    curl -X GET http://node23.codenvy.io:53581/clientes
    
    Para listar todos os clientes, o método usado é o GET juntamente com a URL /clientes.
    O retorno deve ser uma lista contendo o nome, telefone, sexo e email de cada cliente.
    
    Sucesso: 200 ok
    
    Resposta: {["nome":"", "telefone": "", "sexo":"F", "email":"", "nome":"", "telefone": "", "sexo":"F", "email":""]}
    
## Produto :paw_prints:

### Adicionar produto 

    curl -X POST http://node23.codenvy.io:53581/produto -d '{"nome":"", "preco": "", "fabricante":"", "validade":""}'
    
    Para o adicionar um produto, usamos o método POST. 
    Nele colocamos os dados nome, preço, fabricante e validade.
    O retorno correto deve ser resp: produtoId.
    
    Sucesso: 201 created
    
    Resposta: {"resp": 2}
    
### Alterar produto 

    curl -X PUT http://node23.codenvy.io:53581/produto/2 -d '{"nome":"", "preco": "", "fabricante":"", "validade":""}'
    
    Para alterar os dados do produto, é utilizado o método PUT, URL e o produto Id. 
    Pode-se alterar nome, preço, fabricante e validade.
    O retorno deve ser resp e o produto Id.
    
    Sucesso: 200 ok
    
    Resposta: {"resp":2}
    
### Deletar produto 

    curl -X DELETE 	http://node23.codenvy.io:53581/produto/3
    
    Para deletar um produto, basta usar o método DELETE e na URL adicionar novamente o produto Id.
    O retorno deve ser vazio.
    
    Sucesso: no content 204
    
    Resposta: vazio
    
### Listar produtos

    curl -X GET http://node23.codenvy.io:53581/produtos
    
    Para listar todos os produtos, o método usado é o GET juntamente com a URL /produto.
    O retorno deve ser uma lista contendo o nome, preço, fabricante e validade de cada produto.
    
    Sucesso: 200 ok
    
    Resposta: {["nome":"", "preço": "", "fabricante":"", "validade":"", "nome"":"", "preço": "", "fabricante":"", "validade":""]}
    
## Serviço :shower:
    
### Adicionar servico

    curl -X POST http://node23.codenvy.io:53581/servico -d '{"nome":"", "preco": ""}' 
    
    Para o adicionar um serviço, usamos o método POST. 
    Nele colocamos os dados nome e preço.
    O retorno correto deve ser resp: servicoId.
    
    Sucesso: 201 created
    
    Resposta: {"resp":3}
    
### Alterar servico

    curl -X PUT http://node23.codenvy.io:53581/servico/1 -d '{"nome":"", "preco": ""}'
    
    Para alterar os dados do serviço, é utilizado o método PUT, URL e o serviço Id. 
    Pode-se alterar nome e preço.
    O retorno deve ser resp e o serviço Id.
    
    Sucesso: 200 ok
    
    Resposta: {"resp":1}
    
### Deletar servico
    
    curl -X DELETE 	http://node23.codenvy.io:53581/servico/2
    
    Para deletar um serviço, basta usar o método DELETE e na URL adicionar novamente o serviço Id.
    O retorno deve ser vazio.
    
    Sucesso: no content 204
    
    Resposta: vazio
    
### Listar servico

    curl -X GET http://node23.codenvy.io:53581/servicos
    
    Para listar todos os serviços, o método usado é o GET juntamente com a URL /servicos.
    O retorno deve ser uma lista contendo o nome, e preço de cada serviço.
    
    
    Sucesso: 200 ok
    
    Resposta: {["nome":"", "preco": ", "nome"":"", "preço": "]}
    
## Agendamento :clock2:

### Adicionar agendamento

    curl -X POST http://node23.codenvy.io:53581/agendamento -d '{"data":"", "servico":"", "animal":""}'
    
    Para o adicionar um agendamento, usamos o método POST. 
    Nele colocamos os dados data, servico e animal.
    O retorno correto deve ser resp: agendamentoId.
    
    Sucesso: 201 created
    
    Resposta: {"resp":3}

### Alterar agendamento

    curl -X PUT -d '{"data":"", "servico":"", "animal":""}' 	http://node23.codenvy.io:53581/agendamento/2
    
    Para alterar os dados do agendamento, é utilizado o método PUT, URL e o agendamento Id. 
    Pode-se alterar data, serviço e animal.
    O retorno deve ser resp e o agendamento Id.
    
    Sucesso: 200 ok
    
    Resposta: {"resp":2}
    
### Alterar agendamentos

    curl -X PATCH -d {[3600,"2016-12-07T03:55:20Z"]} 	http://node23.codenvy.io:53581/agendamentos
    
    Caso haja necessidade de alterar todos os agendamentos, é utilizado o método PATCH seguido por segundos e data.
    A URL deve ser a agendamentos.
    O retorno deve ser vazio.
    
    Sucesso: 200 ok
    
    Resposta: No content

### Deletar agendamento

    curl -X DELETE 	http://node23.codenvy.io:53581/agendamento/3
    
    Para deletar um agendamento, basta usar o método DELETE e na URL adicionar novamente o agendamento Id.
    O retorno deve ser vazio.
    
    Sucesso: no content 204
    
    Resposta: vazio

### Listar agendamentos

    curl -X GET http://node23.codenvy.io:53581/agendamentos
    
    Para listar todos os agendamentos, o método usado é o GET juntamente com a URL /agendamento.
    O retorno deve ser uma lista contendo a data, o serviço e o animal.
    
    Sucesso: 200 ok
    
    Resposta: {["data":"", "servico":"", "animal":"", "data":"", "servico":"", "animal":""]}
    
## Animal :dog:
     
### Adicionar animal

    curl -X POST http://node23.codenvy.io:53581/animal -d '{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}' 
    
    Para o adicionar um animal, usamos o método POST. 
    Nele colocamos os dados nome, nascimento, tipo e cliente Id.
    O retorno correto deve ser resp: animalId.
    
    Sucesso: 201 created
    
    Resposta: {"resp":2}
    
### Alterar animal
    
    curl -X PUT http://node23.codenvy.io:53581/animal/2 -d '{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}'
    
    Para alterar os dados do animal, é utilizado o método PUT, URL e o animal Id. Pode-se alterar nome, nascimento, tipo e cliente Id.
    O retorno correto deve ser resp: animalId.
    
    Sucesso: 200 ok
    
    Resposta: {"resp":2}
    
### Deletar animal

    curl -X DELETE 	http://node23.codenvy.io:53581/animal/3
    
    Para deletar um animal, basta usar o método DELETE e na URL adicionar novamente o animal Id.
    O retorno deve ser vazio.
    
    Sucesso: no content 204
    
    Resposta: vazio
    
### Listar animais

    curl -X GET http://node23.codenvy.io:53581/animais
    
    Para listar todos os animais, o método usado é o GET juntamente com a URL /animal.
    O retorno deve ser uma lista contendo o nome, nascimento, tipo e cliente Id de cada animal.
    
    Sucesso: 200 ok
    
    Resposta: {[{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}, {"nome":"", "nascimento":"", "tipo":"", "clienteId":""}]}
    