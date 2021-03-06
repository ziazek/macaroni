defmodule Macaroni.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    topologies = Application.get_env(:libcluster, :topologies)

    children = [
      # libcluster
      {Cluster.Supervisor, [topologies, [name: Macaroni.ClusterSupervisor]]},
      # Start the Ecto repository
      Macaroni.Repo,
      # Start the endpoint when the application starts
      MacaroniWeb.Endpoint
      # Starts a worker by calling: Macaroni.Worker.start_link(arg)
      # {Macaroni.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Macaroni.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MacaroniWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
