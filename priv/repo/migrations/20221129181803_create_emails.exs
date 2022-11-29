defmodule MailTester.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:postmark_alias, :text)
      add(:postmark_template_id, :integer)
      add(:postmark_associated_server_id, :integer)

      timestamps(type: :timestamptz)
    end

    create(unique_index(:emails, [:postmark_alias]))
    create(unique_index(:emails, [:postmark_template_id]))
  end
end
