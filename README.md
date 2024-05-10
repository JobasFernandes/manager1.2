#CursoDev.com
Para instalar acesse no site e assista o video de instalação.

## Instalação em Docker

- Ter o docker instalado numa vps
```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

- Clone esse repositório
```shell
git clone https://github.com/thiagociavolela/manager1.2.git
```

- Renomear o .env-exemplo para .env, inserir suas informações e inicie a aplicação
```shell
docker compose up -d
```