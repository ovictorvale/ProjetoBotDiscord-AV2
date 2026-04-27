defmodule Bbot.Command.Store.BbotCli do
  alias Bbot.Command.Store.BbotList
  alias Bbot.Command.Store.BbotStore

  def handle(msg) do
    tarefas = BbotStore.load()

    case msg.content do
      "!lembretes" ->
        BbotList.list(tarefas)

      "!lembrar " <> texto ->
        updated = BbotList.add(tarefas, String.trim(texto))
        BbotStore.save(updated)
        "Tarefa adicionada com sucesso!"

      "!lembrar" ->
        "Use o comando assim: !lembrar <sua tarefa>"

      _ ->
        "Comando inválido, verifique e tente novamente."
    end
  end
end
