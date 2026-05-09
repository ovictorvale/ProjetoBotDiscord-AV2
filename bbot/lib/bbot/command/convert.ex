defmodule Bbot.Command.Convert do
  def handle_convert(msg) do
    case String.split(msg.content, " ") do
      ["!convert"] -> "Use: !convert <valor> <origem> <destino>. Ex: !convert 100 BRL USD"

      ["!convert", number, origem, destino] -> convert(number, origem, destino)

      _ -> "Comando inválido. Use: !convert 100 BRL USD"
    end
  end

  defp convert(valor, origem, destino) do
    case Float.parse(valor) do
      {valor_numero, _} ->

        origem = String.upcase(origem)
        destino = String.upcase(destino)

        {:ok, response} =
          HTTPoison.get("https://open.er-api.com/v6/latest/#{destino}")
        {:ok, json} = Jason.decode(response.body)

        cotacao = json["rates"][origem]

        valor_dolar = valor_numero / cotacao

        "R$ #{valor_numero} = US$ #{Float.round(valor_dolar, 2)}"

      :error ->
        "Digite um número válido. Ex: !convert 100 BRL USD"
    end
  end
end
