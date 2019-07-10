defmodule Botiful.Render.Engine do
  use GenServer


  def start_link(url) do
    GenServer.start_link(__MODULE__, url)
  end

  def url(pid) do
    GenServer.call(pid, :url)
  end

  # Server Callbacks
  def init(url) do
    {:ok, %{url: url}}
  end

  def handle_call(:url, _from, state) do
    {:reply, state.url, state}
  end
end