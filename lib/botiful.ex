defmodule Botiful do
  @moduledoc """
  Documentation for Botiful.
  """   
  
  use Plug.Router

  plug Plug.Logger

  plug Plug.Static,
    at: "/",
    from: {:botiful, "priv/static"},
    only: ~w(index.html)
  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, :ok, "world")
  end

  get "/" do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> send_file(:ok, root())
  end
  match(_, do: send_resp(conn, :not_found, "oh no"))

  defp root do
    Enum.join ([:code.priv_dir(:botiful), "/static/index.html"])
  end
end
