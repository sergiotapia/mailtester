defmodule MailTester.Repo.Migrations.CreateEmailPerformances do
  use Ecto.Migration

  def change do
    create table(:email_performances, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :event_timestamp, :naive_datetime
      add :event_type, :text
      add :sent_email_id, references(:sent_emails, on_delete: :nothing, type: :binary_id)

      timestamps(type: :timestamptz)
    end

    create index(:email_performances, [:sent_email_id])
  end
end
