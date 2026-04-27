defmodule Bbot.Command.Clima do

  def handle_clima(msg) do
    list = msg.content |>String.trim()|>String.split(" ")
    case list do
      ["!clima"] -> "Use o comando !clima <nome da cidade>"
      ["!clima", nome_cidade] -> create_response(nome_cidade)
      _-> "Comando inválido, verifique e tente novamente."

    end
  end


  defp create_response(nome_cidade) do
    {:ok, response} = HTTPoison.get("https://wttr.in/#{nome_cidade}?format=3")
    cond do
      String.contains?(response.body, "erro") -> "A cidade inserída não é válida, verifique e tente novamente"
      true ->
        response.body

    end
  end

end
