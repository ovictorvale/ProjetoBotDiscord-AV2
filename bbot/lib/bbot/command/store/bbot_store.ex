defmodule Bbot.Command.Store.BbotStore do
  @file_path "bbot_store.json"

  def load do
    case File.read(@file_path) do
      {:ok, content}->
        content
        |> Jason.decode!()
        |> Enum.map(fn t-> %{id: t["id"], tarefa: t["tarefa"]}end)

      {:error, _} -> []
    end
  end

  def save(tarefa) do
    tarefa
    |>Jason.encode!(pretty: true)
    |>then(&File.write!(@file_path, &1))
  end

end
