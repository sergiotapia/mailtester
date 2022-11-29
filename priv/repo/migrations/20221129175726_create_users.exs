defmodule MailTester.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :text
      add :hashed_password, :text

      timestamps(type: :timestamptz)
    end

    create unique_index(:users, [:email])
  end
end
