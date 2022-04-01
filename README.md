Proposta: Tudo via TERRAFORM!!!

Criar uma nova VPC, não pode ser a default da conta
3 subnets públicas, uma em cada AZ dentro da nova VPC
3 subnets privadas, uma em cada AZ dentro da nova VPC
1 - Internet Gateway
1 - Nat Gateway
2 - Security groups
3 - Instancias EC2 utilizando a AMI da amazon Linux, instalar o apache liberar o acesso conforme abaixo:
	- Alterar o arquivo /var/www/html/index.html adicionando o texto "Servidor Apache 1", e subir o serviço na porta 3001
	- Alterar o arquivo /var/www/html/index.html adicionando o texto "Servidor Apache 2", e subir o serviço na porta 3002
	- Alterar o arquivo /var/www/html/index.html adicionando o texto "Servidor Apache 3", e subir o serviço na porta 3003
Obs: As 3 instancias devem ser deployadas uma em cada subnet privada com acesso a internet somente para instalação de pacotes, o apache não deve mostrar sua versão aos clientes atráves do nmap ou inspect via browser, desabilitar a versão 1.0 http e configurar no SO o tcp reuse e tcp port recycle (Que serve para reutilizar as portas TCP do kernel)

1 - Instancia com nginx em uma subrede publica que será utilizada como LoadBalancer conforme abaixo: Esta instancia deve ter acesso full a internet e acesso as portas de serviço das EC2 com apache via Security Group. Configurar o LoadBalancer no modo Random e acessivel via porta 8080, durante a apresentação o acesso deve ser feito no ip publico desta EC2 para validar o funcionamento do balancer
	1- Bucket S3 sem acesso a internet para servir de repositório para o terraform.tfstate


##Obrigatorio

AS EC2 devem ser deployadas utilizando "count" através do módulo criado no ultimo desafio;
As subnets devem ser criadas utilizando "count" ou "for_each";
Necessario ter output dos ips privados das 3 EC2 com apache e do ip publico da EC2 com nginx;
Utilizar dynamic block para provisionamento de um item de sua escolha da infraestrutura.
