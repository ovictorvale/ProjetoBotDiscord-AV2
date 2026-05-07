
Este projeto é um bot para Discord desenvolvido em Elixir, utilizando o framework Nostrum.

O objetivo do projeto é praticar os conceitos vistos na disciplina de Programação Funcional, como uso de módulos, pattern matching, consumo de APIs REST, pipe operator, GenServer, Supervisor e persistência de dados em JSON.

## Tecnologias utilizadas

- Elixir
- Nostrum
- HTTPoison
- Jason
- GenServer
- Supervisor

## Sobre o projeto

O Bbot recebe comandos enviados pelos usuários no Discord e responde de acordo com a funcionalidade chamada.

Foram implementados comandos simples, comandos com parâmetros, comandos que consomem APIs externas e comandos com persistência de dados em arquivo JSON.

## Como configurar o token

O token do bot não deve ficar escrito diretamente no código.

Para configurar o token no Windows PowerShell, use:

```bash
$env:DISCORD_BOT_TOKEN="seu_token_aqui"
```

No Linux ou macOS, use:

```bash
export DISCORD_BOT_TOKEN="seu_token_aqui"
```

No arquivo de configuração, o token é lido pela variável de ambiente:

```elixir
config :nostrum,
  token: System.get_env("DISCORD_BOT_TOKEN")
```

## Como instalar as dependências

Dentro da pasta do projeto, execute:

```bash
mix deps.get
```

Depois compile o projeto:

```bash
mix compile
```

## Como rodar o bot

Para iniciar o bot no Discord, execute:

```bash
mix run --no-halt
```

Também é possível rodar com o terminal interativo do Elixir:

```bash
iex -S mix
```

## Comandos do bot

### Ping

```text
!ping
```

Retorna uma resposta simples do bot.

### Fact

```text
!fact
```

Busca uma curiosidade aleatória em uma API externa.

### Fox

```text
!fox
```

Retorna uma imagem aleatória de raposa.

### Clima

```text
!clima fortaleza
```

Consulta o clima atual da cidade informada.

### Convert

```text
!convert 100 BRL USD
```

Converte um valor entre duas moedas.

### Pokémon

```text
!pokemon pikachu
```

Busca informações básicas sobre um Pokémon.

### Filme

```text
!filme batman 1989
```

Busca informações básicas sobre um filme.

### Curiosidade

```text
!curiosidade fortaleza
```

Busca informações de uma cidade utilizando duas APIs.

### Lembrar

```text
!lembrar estudar Elixir
```

Salva um lembrete em um arquivo JSON local.

### Lembretes

```text
!lembretes
```

Lista os lembretes salvos anteriormente.

## Persistência de dados

O comando de lembretes utiliza persistência em JSON.

Quando o bot é iniciado, o GenServer carrega os lembretes salvos no arquivo JSON. Quando um novo lembrete é adicionado, o estado interno é atualizado e o arquivo JSON é salvo novamente.

Assim, mesmo que o bot seja encerrado e iniciado novamente, os lembretes continuam salvos.

## Organização do código

O projeto foi dividido em módulos para facilitar a organização e a explicação.

O módulo `Bbot` recebe os eventos do Discord e direciona os comandos.

O módulo `Bbot.Application` inicia a aplicação e supervisiona os processos.

Os módulos dentro de `Bbot.Command` são responsáveis pelos comandos do bot.

Os módulos dentro de `Bbot.Command.Store` são responsáveis pela parte dos lembretes, incluindo o GenServer, a lista de tarefas e a leitura e escrita no arquivo JSON.

## Gitignore

O projeto utiliza um arquivo `.gitignore` para evitar o envio de arquivos gerados automaticamente pelo Elixir e pelo Mix.

Arquivos e pastas como `_build`, `deps`, `doc`, `tmp` e arquivos de crash da VM não devem ser enviados para o GitHub.

