defmodule Botiful.MixProject do
  use Mix.Project

  def project do
    [
      app: :botiful,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:cowboy, :plug, :logger],
      mod: {Botiful.Application, []}
    ]
  end
  defp applications(:dev), do: applications(:all) ++ [:remix]
  defp applications(_all), do: [:cowboy, :plug, :logger]
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Web request
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.6"},
      {:plug_cowboy, "~> 2.0"},
      # Development reloading
      {:remix, "~> 0.0.1", only: :dev},

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
