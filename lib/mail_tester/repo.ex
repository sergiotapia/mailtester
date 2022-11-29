defmodule MailTester.Repo do
  use Ecto.Repo,
    otp_app: :mail_tester,
    adapter: Ecto.Adapters.Postgres
end
