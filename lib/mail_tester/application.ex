defmodule MailTester.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MailTesterWeb.Telemetry,
      # Start the Ecto repository
      MailTester.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MailTester.PubSub},
      # Start Finch
      {Finch, name: MailTester.Finch},
      # Start the Endpoint (http/https)
      MailTesterWeb.Endpoint
      # Start a worker by calling: MailTester.Worker.start_link(arg)
      # {MailTester.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MailTester.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MailTesterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
