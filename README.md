Adicionar cliente 

    curl -X POST -d {"nome":"", "telefone": "", "sexo":"", "email":""} 
    
Alterar cliente

    curl -X PUT -d {"nome":"", "telefone": "", "sexo":"", "email":""} 

Deletar cliente

    curl -X DELETE 

Adicionar produto 

    curl -X POST -d {"nome"":"", "preço": "", "fabricante":"", "validade":""} 
    
Alterar produto 

    curl -X PUT -d {"nome"":"", "preço": "", "fabricante":"", "validade":""} 
    
Deletar produto 

    curl -X DELETE 
    
Adicionar servico

    curl -X POST -d {"nome"":"", "preço": ""}
    
Alterar servico

    curl -X PUT -d {"nome"":"", "preço": ""}
    
Deletar servico
    
    curl -X DELETE

Adicionar agendamento

    curl -X POST -d {"data":"", "servico":"", "animal":""}

Alterar agendamento

    curl -X PUT -d {"data":"", "servico":"", "animal":""}

Deletar agendamento

    curl -X DELETE 
    
Adicionar animal

    curl -X POST -d {"nome":"", "nascimento":"", "tipo":"", "clienteId":""}
    
Alterar animal
    
    curl -X PUT -d {"nome":"", "nascimento":"", "tipo":"", "clienteId":""}
    
    
    