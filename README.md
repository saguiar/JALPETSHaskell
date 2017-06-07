Adicionar cliente 

    curl -X POST http://node23.codenvy.io:53581/cliente -d '{"nome":"", "telefone": "", "sexo":"M", "email":""}'
    
    Sucesso: 201 created 
    
    Resposta: {"resp":5}
    
Alterar cliente

    curl -X PUT http://node23.codenvy.io:53581/cliente/1 -d '{"nome":"", "telefone": "", "sexo":"F", "email":""}'
    
    Sucesso: ok 200
    
    Resposta: {"resp":1}

Deletar cliente

    curl -X DELETE http://node23.codenvy.io:53581/cliente/5
    
    Sucesso: no content 204

    Resposta: vazio
    
    
Adicionar produto 

    curl -X POST http://node23.codenvy.io:53581/produto -d '{"nome"":"", "preço": "", "fabricante":"", "validade":""}'
    
    Sucesso: 201 created
    
    Resposta: {"resp": 2}
    
Alterar produto 

    curl -X PUT http://node23.codenvy.io:53581/produto/2 -d '{"nome"":"", "preço": "", "fabricante":"", "validade":""}'
    
    Sucesso: ok 200
    
    Resposta: {"resp":2}
    
Deletar produto 

    curl -X DELETE 	http://node23.codenvy.io:53581/produto/3
    
    Sucesso: no content 204
    
    Resposta: vazio
    
Adicionar servico

    curl -X POST http://node23.codenvy.io:53581/servico -d '{"nome"":"", "preço": ""}' 
    
    Sucesso: 201 created
    
    Resposta: {"resp":3}
    
Alterar servico

    curl -X PUT http://node23.codenvy.io:53581/servico/1 -d '{"nome"":"", "preço": ""}'
    
    Sucesso: ok 200
    
    Resposta: {"resp":1}
    
Deletar servico
    
    curl -X DELETE 	http://node23.codenvy.io:53581/servico/2
    
    Sucesso: no content 204
    
    Resposta: vazio

Adicionar agendamento

    curl -X POST http://node23.codenvy.io:53581/agendamento -d '{"data":"", "servico":"", "animal":""}'
    
    Sucesso: 201 created
    
    Resposta: {"resp":3}

Alterar agendamento

    curl -X PUT -d '{"data":"", "servico":"", "animal":""}' 	http://node23.codenvy.io:53581/agendamento/2
    
    Sucesso: ok 200
    
    Resposta: {"resp":2}
    
Alterar agendamento

    curl -X PATCH -d {[,]} 	http://node23.codenvy.io:53581/agendamentos
    
    Sucesso: ok 200
    
    Resposta: No content

Deletar agendamento

    curl -X DELETE 	http://node23.codenvy.io:53581/agendamento/3
    
    Sucesso: no content 204
    
    Resposta: vazio
     
Adicionar animal

    curl -X POST http://node23.codenvy.io:53581/animal -d '{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}' 
    
    Sucesso: 201 created
    
    Resposta: {"resp":2}
    
Alterar animal
    
    curl -X PUT http://node23.codenvy.io:53581/animal/2 -d '{"nome":"", "nascimento":"", "tipo":"", "clienteId":""}'
    
    Sucesso: ok 200
    
    Resposta: {"resp":2}
    
Deletar animal

    curl -X DELETE 	http://node23.codenvy.io:53581/animal/3
    
    Sucesso: no content 204
    
    Resposta: vazio
    