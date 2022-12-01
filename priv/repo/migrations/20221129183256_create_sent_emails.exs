defmodule MailTester.Repo.Migrations.CreateSentEmails do
  use Ecto.Migration

  def change do
    create table(:sent_emails, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sent_at, :utc_datetime
      add :postmark_message_id, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :email_version_id, references(:email_versions, on_delete: :nothing, type: :binary_id)

      timestamps(type: :timestamptz)
    end

    create index(:sent_emails, [:user_id])
    create index(:sent_emails, [:email_version_id])
    create index(:sent_emails, [:postmark_message_id])
  end
end
