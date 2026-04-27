defmodule Bbot.Command.Filme do
  def handle_filme(msg) do
    case String.split(msg.content, " ") do
      ["!filme"] ->
        "Use: !filme <nome> <ano>. Ex: !filme batman 1989"

      ["!filme", nome, ano] ->
        create_response(nome, ano)

      _ ->
        "Comando inválido. Use: !filme batman 1989"
    end
  end

  defp create_response(nome, ano) do
    api_key = "9515d650"

    {:ok, response} = HTTPoison.get("http://www.omdbapi.com/?t=#{URI.encode(nome)}&y=#{ano}&apikey=#{api_key}")
    {:ok, json} = Jason.decode(response.body)

    case json["Response"] do
      "True" ->
        titulo = json["Title"]
        ano = json["Year"]
        nota = json["imdbRating"]
        genero = json["Genre"]

        "🎬 #{titulo} (#{ano})\n #{genero}\n IMDb: #{nota}"

      _ ->
        "Filme não encontrado."
    end
  end
end
