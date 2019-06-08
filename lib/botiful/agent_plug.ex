defmodule Botiful.AgentPlug do
  @moduledoc """
  Detects the user agent and identifies the type of user
  accessing our server
  """

  import Plug.Conn
  
  require IEx
  
  def init(options), do: options
  
  def call(conn, _opts) do
    IEx.pry
  end
end