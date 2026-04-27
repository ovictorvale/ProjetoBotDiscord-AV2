defmodule Bbot.Command.Fact do

  def handle_fact(_msg) do
      {:ok, response} = HTTPoison.get("https://uselessfacts.jsph.pl/api/v2/facts/random?language=en")
      {:ok, json} = Jason.decode(response.body)
      json["text"]
  end
end
