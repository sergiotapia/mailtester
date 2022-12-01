defmodule MailTester.Emails.SentEmail do
  use Ecto.Schema
  import Ecto.Changeset
  alias MailTester.Accounts.User
  alias MailTester.Emails.EmailPerformance
  alias MailTester.Emails.EmailVersion

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "sent_emails" do
    field :sent_at, :utc_datetime

    # Postmark's internal id for the sent email. We use
    # this field to match a webhook event data to a specific
    # sent email for metrics.
    field :postmark_message_id, :string

    belongs_to :user, User
    belongs_to :email_version, EmailVersion
    has_many :email_performances, EmailPerformance

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(sent_email, attrs) do
    sent_email
    |> cast(attrs, [:sent_at, :user_id, :email_version_id, :postmark_message_id])
    |> validate_required([:sent_at, :user_id, :email_version_id, :postmark_message_id])
  end
end
