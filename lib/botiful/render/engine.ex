defmodule Botiful.Render.Engine do
  use GenServer

  alias ChromeRemoteInterface.{
    RPC,
    PageSession
  }

  require Logger

  def start_link(url) do
    GenServer.start_link(__MODULE__, url)
  end


  # Server Callbacks
  def init(url) do
    conn = ChroxyClient.page_session!(%{ host: "localhost", port: 1330})
   
    
    {:ok, _} = RPC.Page.enable(conn)
    #{:ok, _} = RPC.Network.enable(conn)

    :ok = PageSession.subscribe(conn, "Page.loadEventFired", self())

    {:ok, _} = RPC.Page.navigate(conn, %{url: url})
    {:ok, %{conn: conn}}

  end
  def handle_info({:chrome_remote_interface, "Page.loadEventFired", data}, state) do
    IO.inspect data
    #Logger.info("data, #{data}")
    {:noreply, state}
  end
end