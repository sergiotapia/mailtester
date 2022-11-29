defmodule MailTester.Repo.Migrations.CreateEmailVersions do
  use Ecto.Migration

  def change do
    create table(:email_versions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :html_body, :text
      add :text_body, :text
      add :version_description, :text
      add :email_id, references(:emails, on_delete: :nothing, type: :binary_id)

      timestamps(type: :timestamptz)
    end

    create index(:email_versions, [:email_id])
  end
end
