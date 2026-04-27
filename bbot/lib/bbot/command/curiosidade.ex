defmodule Bbot.Command.Curiosidade do
  def handle_curiosidade(msg) do
    case String.split(msg.content, " ") do
      ["!curiosidade"] ->
        "Use: !curiosidade <cidade>. Ex: !curiosidade fortaleza"

      ["!curiosidade", cidade] ->
        create_response(cidade)

      _ ->
        "Comando inválido. Use: !curiosidade fortaleza"
    end
  end

  defp create_response(cidade) do
    url_geo =
      "https://nominatim.openstreetmap.org/search?q=#{URI.encode(cidade)}&format=json&limit=1"

    {:ok, geo_response} = HTTPoison.get(url_geo)
    {:ok, geo_json} = Jason.decode(geo_response.body)

    case geo_json do
      [local | _] ->
        nome_local = local["display_name"]

        {:ok, clima_response} = HTTPoison.get("https://wttr.in/#{URI.encode(nome_local)}?format=3")

        "Local encontrado: #{nome_local}\n Clima atual: #{clima_response.body}"

      [] ->
        "Cidade não encontrada."
    end
  end
end
