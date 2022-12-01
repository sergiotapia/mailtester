defmodule MailTester.Emails.EmailPerformance do
  use Ecto.Schema
  import Ecto.Changeset
  alias MailTester.Emails.SentEmail

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "email_performances" do
    field :event_timestamp, :utc_datetime
    field :event_type, Ecto.Enum, values: [:clicked, :opened]

    belongs_to :sent_email, SentEmail

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(email_performance, attrs) do
    email_performance
    |> cast(attrs, [:event_timestamp, :event_type, :sent_email_id])
    |> validate_required([:event_timestamp, :event_type, :sent_email_id])
  end
end
