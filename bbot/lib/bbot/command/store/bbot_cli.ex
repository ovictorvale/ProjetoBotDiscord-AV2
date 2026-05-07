defmodule Bbot.Command.Store.BbotCli do
  alias Bbot.Command.Store.BbotServer

  def handle(msg) do
    case msg.content do
      "!lembretes" ->
        BbotServer.listar()

      "!lembrar " <> texto ->
        texto
        |> String.trim()
        |> BbotServer.adicionar()

      "!lembrar" ->
        "Use o comando assim: !lembrar <sua tarefa>"

      _ ->
        "Comando inválido, verifique e tente novamente."
    end
  end
end
