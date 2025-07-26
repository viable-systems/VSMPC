defmodule Vsmcp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VsmcpWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:vsmcp, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Vsmcp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Vsmcp.Finch},
      # Start a worker by calling: Vsmcp.Worker.start_link(arg)
      # {Vsmcp.Worker, arg},
      # Start to serve requests, typically the last entry
      VsmcpWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vsmcp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VsmcpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
