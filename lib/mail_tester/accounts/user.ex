defmodule MailTester.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias MailTester.Emails.SentEmail

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :hashed_password, :string

    has_many :sent_emails, SentEmail

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :hashed_password])
    |> validate_required([:email, :hashed_password])
    |> unique_constraint(:email)
  end
end
