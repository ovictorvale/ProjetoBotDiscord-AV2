defmodule Bbot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Bbot.Worker.start_link(arg)
      # {Bbot.Worker, arg}
      Bbot
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bbot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
