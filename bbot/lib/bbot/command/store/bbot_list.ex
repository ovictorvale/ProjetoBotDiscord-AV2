defmodule Bbot.Command.Store.BbotList do

  defp new_id, do: :os.system_time(:millisecond)

  def add(tarefas, tarefa) do
    task = %{id: new_id(), tarefa: tarefa}
    tarefas++ [task]
  end


  def delete(tarefas, id) do
    Enum.reject(tarefas, fn t -> t.id == id end)
  end

  def list(tarefas) do
    if Enum.empty?(tarefas) do
      "Ainda não tem nenhuma tarefa cadastrada."
    else
      tarefas
      |> Enum.map(fn t ->
        "• #{t.id} - #{t.tarefa}"
      end)
      |> Enum.join("\n")
    end
  end

end
