defmodule Bbot.Command.Pokemon do

  def handle_pokemon(msg) do
    list = msg.content |>String.trim() |>String.split(" ")

    case list do
      ["!pokemon"] -> "Use o comando: !pokemon <nome do pokemon>"
      ["!pokemon", nome_pokemon] -> create_response(nome_pokemon)
      _-> "Comando inválido, verfique e tente novamente."

    end
  end

  defp create_response(nome_pokemon) do
    {:ok, response} = HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{nome_pokemon}")

    case Jason.decode(response.body) do
      {:ok, json} ->
        nome = json["name"]
        tipo = List.first(json["types"])["type"]["name"]
        imagem = json["sprites"]["front_default"]

        "🎮 #{String.capitalize(nome)}\nTipo: #{tipo}\n#{imagem}"

      {:error, _} ->
        "Pokémon não encontrado."
    end
  end
end
