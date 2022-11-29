defmodule MailTester.Emails.Email do
  use Ecto.Schema
  import Ecto.Changeset
  alias MailTester.Emails.EmailVersion

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "emails" do
    # Postmark's "slug" for the template, eg. `"welcome-email"`
    field :postmark_alias, :string

    # Postmark's internal id for the template. Used for API calls
    # towards a specific tempalte. eg. `1234`
    field :postmark_template_id, :integer

    # Postmark's internal id for the server the template belongs
    # to. As seen on https://account.postmarkapp.com/servers. eg.
    # `1234`
    field :postmark_associated_server_id, :integer

    has_many :email_versions, EmailVersion

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:postmark_alias, :postmark_template_id, :postmark_associated_server_id])
    |> validate_required([:postmark_alias, :postmark_template_id, :postmark_associated_server_id])
    |> unique_constraint(:postmark_alias)
    |> unique_constraint(:postmark_template_id)
  end
end
