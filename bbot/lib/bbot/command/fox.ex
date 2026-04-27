defmodule Bbot.Command.Fox do

  def handle_fox(_msg) do
    {:ok, response} = HTTPoison.get("https://randomfox.ca/floof/")
    {:ok, json} = Jason.decode(response.body)
    json["image"]
  end
end
