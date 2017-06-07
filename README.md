Adicionar cliente 

    curl -X POST -d {"nome":"", "telefone": "", "sexo":"", "email":""}  http://node23.codenvy.io:53581/cliente/
    
Alterar cliente

    curl -X PUT -d {"nome":"", "telefone": "", "sexo":"", "email":""} http://node23.codenvy.io:53581/cliente/1

Deletar cliente

    curl -X DELETE http://node23.codenvy.io:53581/cliente/5

Adicionar produto 

    curl -X POST -d {"nome"":"", "preço": "", "fabricante":"", "validade":""} 	http://node23.codenvy.io:53581/produto/
    
Alterar produto 

    curl -X PUT -d {"nome"":"", "preço": "", "fabricante":"", "validade":""} 	http://node23.codenvy.io:53581/produto/2
    
Deletar produto 

    curl -X DELETE 	http://node23.codenvy.io:53581/produto/3
    
Adicionar servico

    curl -X POST -d {"nome"":"", "preço": ""} 	http://node23.codenvy.io:53581/servico/
    
Alterar servico

    curl -X PUT -d {"nome"":"", "preço": ""} 	http://node23.codenvy.io:53581/servico/1
    
Deletar servico
    
    curl -X DELETE 	http://node23.codenvy.io:53581/servico/2

Adicionar agendamento

    curl -X POST -d {"data":"", "servico":"", "animal":""} 	http://node23.codenvy.io:53581/agendamento

Alterar agendamento

    curl -X PUT -d {"data":"", "servico":"", "animal":""} 	http://node23.codenvy.io:53581/agendamento/2
    
Alterar agendamento

    curl -X PATCH -d {[,]} 	http://node23.codenvy.io:53581/agendamentos

Deletar agendamento

    curl -X DELETE 	http://node23.codenvy.io:53581/agendamento/3
     
Adicionar animal

    curl -X POST -d {"nome":"", "nascimento":"", "tipo":"", "clienteId":""} 	http://node23.codenvy.io:53581/animal/
    
Alterar animal
    
    curl -X PUT -d {"nome":"", "nascimento":"", "tipo":"", "clienteId":""} 	http://node23.codenvy.io:53581/animal/2
    
Deletar animal

    curl -X DELETE 	http://node23.codenvy.io:53581/animal/3
    