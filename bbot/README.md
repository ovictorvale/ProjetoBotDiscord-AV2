# Bbot

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bbot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bbot, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/bbot>.


# Bbot

Bot para Discord desenvolvido em Elixir utilizando o framework Nostrum, com integração de múltiplas APIs REST e persistência de dados em JSON.

---

## Descrição

O Bbot foi desenvolvido como atividade da disciplina de Programação Funcional, com o objetivo de aplicar conceitos como:

* Comunicação com APIs REST (HTTPoison)
* Manipulação de dados com Enum e Map
* Pattern Matching
* Persistência de dados em JSON
* Organização modular do código

---

## Tecnologias utilizadas

* Elixir
* Nostrum (Discord API)
* HTTPoison (requisições HTTP)
* Jason (manipulação de JSON)

---

## Configuração

### 1. Clonar o projeto

```bash
git clone <link-do-repositorio>
cd bbot
```

---

### 2. Configurar o token do Discord

No terminal:

#### Linux / Mac:

```bash
export DISCORD_TOKEN="seu_token_aqui"
```

#### Windows (PowerShell):

```powershell
$env:DISCORD_TOKEN="seu_token_aqui"
```

---

### 3. Instalar dependências

```bash
mix deps.get
```

---

### 4. Executar o bot

```bash
mix run --no-halt
```

---

## Comandos disponíveis

### Sem parâmetro

```text
!ping
```

Resposta: `!pong`

---

### Com um parâmetro

```text
!clima fortaleza
```

Retorna o clima atual da cidade.

```text
!pokemon pikachu
```

Retorna informações do Pokémon.

---

### Com dois ou mais parâmetros

```text
!dollar 100 BRL USD
```

Converte valores entre moedas.

```text
!filme batman 1989
```

Retorna informações sobre um filme.

---

### Persistência em JSON

```text
!lembrar estudar elixir
```

Salva um lembrete.

```text
!lembretes
```

Lista todos os lembretes salvos.

---

### Combinação de APIs

```text
!curiosidade fortaleza
```

Retorna informações da cidade e o clima atual, combinando duas APIs.

---

## Persistência de dados

Os lembretes são armazenados em um arquivo local:

```text
bbot_store.json
```

Esse arquivo permite que os dados sejam mantidos mesmo após reiniciar o bot.

---

## Estrutura do projeto

```text
lib/
├── bbot.ex
├── bbot/command/
│   ├── clima.ex
│   ├── convert.ex
│   ├── filme.ex
│   ├── pokemon.ex
│   ├── fact.ex
│   ├── fox.ex
│   └── store/
│       ├── bbot_store.ex
│       ├── bbot_list.ex
│       └── bbot_cli.ex
```

---

## Exemplos de uso

```text
!ping
!clima fortaleza
!pokemon gengar
!dollar 100 BRL USD
!filme batman 1989
!lembrar estudar elixir
!lembretes
!curiosidade fortaleza
```

---


## Autor

Victor Menezes do Vale
