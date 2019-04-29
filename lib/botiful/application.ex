defmodule Botiful.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  
  require Logger

  @port 8080

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Plug.Adapters.Cowboy2, scheme: :http, plug: Botiful, options: [port: 8080]}
      # Starts a worker by calling: Botiful.Worker.start_link(arg)
      # {Botiful.Worker, arg}
    ]

    Logger.info("Listening on port #{@port} ...")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Botiful.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
