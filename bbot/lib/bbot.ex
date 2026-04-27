defmodule Bbot do

  use Nostrum.Consumer

  alias Bbot.Command.Store.BbotCli
  alias Nostrum.Api.Message

  def handle_event({:MESSAGE_CREATE, msg, _ws}) do
    cond do
      String.starts_with?(msg.content, "!ping") -> Message.create(msg.channel_id, "!pong")

      String.starts_with?(msg.content, "!fact") -> Message.create(msg.channel_id, Bbot.Command.Fact.handle_fact(msg))

      String.starts_with?(msg.content, "!clima") -> Message.create(msg.channel_id, Bbot.Command.Clima.handle_clima(msg))

      String.starts_with?(msg.content, "!convert") -> Message.create(msg.channel_id, Bbot.Command.Convert.handle_convert(msg))

      String.starts_with?(msg.content, "!fox") -> Message.create(msg.channel_id, Bbot.Command.Fox.handle_fox(msg))

      String.starts_with?(msg.content, "!lembrar") -> Message.create(msg.channel_id, BbotCli.handle(msg))

      String.starts_with?(msg.content, "!lembretes") -> Message.create(msg.channel_id, BbotCli.handle(msg))

      String.starts_with?(msg.content, "!pokemon") -> Message.create(msg.channel_id, Bbot.Command.Pokemon.handle_pokemon(msg))

      String.starts_with?(msg.content, "!filme") -> Message.create(msg.channel_id, Bbot.Command.Filme.handle_filme(msg))

      String.starts_with?(msg.content, "!curiosidade") -> Message.create(msg.channel_id, Bbot.Command.Curiosidade.handle_curiosidade(msg))

      true -> :ignore
    end
  end

end
