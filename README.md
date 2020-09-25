# redis_sentinel_nginx_HA
Itens necessarios: 
- Docker 
- Docker-compose

# Faça o Download do projeto 
Deploy: 
sh deploy.sh ou ./deploy.sh 

Em caso de falhas ou manutenção de um container redis, restart e execute o arquivo sync.sh
assim os conteiners irão sincronyzar novamente com o primario e o Nginx retornará para envio da requisição principal. 
