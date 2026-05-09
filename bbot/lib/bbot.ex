defmodule Bbot do
  use Nostrum.Consumer

  alias Nostrum.Api.Message
  alias Bbot.Command.Store.BbotCli

  def handle_event({:MESSAGE_CREATE, %{content: "!ping"} = msg, _ws}) do
    responder(msg, "!pong")
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!fact"} = msg, _ws}) do
    responder(msg, Bbot.Command.Fact.handle_fact(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!fox"} = msg, _ws}) do
    responder(msg, Bbot.Command.Fox.handle_fox(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!clima" <> _resto} = msg, _ws}) do
    responder(msg, Bbot.Command.Clima.handle_clima(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!convert" <> _resto} = msg, _ws}) do
    responder(msg, Bbot.Command.Convert.handle_convert(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!lembrar" <> _resto} = msg, _ws}) do
    responder(msg, BbotCli.handle(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!lembretes"} = msg, _ws}) do
    responder(msg, BbotCli.handle(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!pokemon" <> _resto} = msg, _ws}) do
    responder(msg, Bbot.Command.Pokemon.handle_pokemon(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!filme" <> _resto} = msg, _ws}) do
    responder(msg, Bbot.Command.Filme.handle_filme(msg))
  end

  def handle_event({:MESSAGE_CREATE, %{content: "!curiosidade" <> _resto} = msg, _ws}) do
    responder(msg, Bbot.Command.Curiosidade.handle_curiosidade(msg))
  end

  def handle_event({:MESSAGE_CREATE, _msg, _ws}) do
    :ignore
  end

  def handle_event(_event) do
    :ignore
  end

  defp responder(msg, resposta) do
    Message.create(msg.channel_id, resposta)
  end
end
