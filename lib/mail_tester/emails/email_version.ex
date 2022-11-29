defmodule MailTester.Emails.EmailVersion do
  use Ecto.Schema
  import Ecto.Changeset
  alias MailTester.Emails.Email
  alias MailTester.Emails.SentEmail

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "email_versions" do
    # HTML body of the email.
    field :html_body, :string

    # Text version of the email for plaintext needs.
    field :text_body, :string

    # Internal string for us to identify what changes were
    # made to this specific email version.
    field :version_description, :string

    belongs_to :email, Email
    has_many :sent_emails, SentEmail

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(email_version, attrs) do
    email_version
    |> cast(attrs, [:html_body, :text_body, :version_description, :email_id])
    |> validate_required([:html_body, :text_body, :version_description, :email_id])
  end
end
