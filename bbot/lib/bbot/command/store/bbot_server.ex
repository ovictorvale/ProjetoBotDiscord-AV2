defmodule Bbot.Command.Store.BbotServer do


  use GenServer
  alias Bbot.Command.Store.BbotStore
  alias Bbot.Command.Store.BbotList

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def listar do
    GenServer.call(__MODULE__, :listar)
  end

  def adicionar(texto) do
    GenServer.call(__MODULE__, {:adicionar, texto})
  end

  def init(_opts) do
    tarefas = BbotStore.load()
    {:ok, tarefas}
  end

  def handle_call(:listar, _from, tarefas) do
    resposta = BbotList.list(tarefas)
    {:reply, resposta, tarefas}
  end

  def handle_call({:adicionar, texto}, _from, tarefas) do
    tarefas_atualizadas = BbotList.add(tarefas, texto)

    BbotStore.save(tarefas_atualizadas)

    {:reply, "Tarefa adicionada com sucesso!", tarefas_atualizadas}
  end

end
