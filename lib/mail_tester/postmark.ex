defmodule MailTester.Postmark do
  alias MailTester.Emails
  alias MailTester.Accounts.User
  require Logger

  def get_message(nil), do: {:error, "message_id cannot be nil"}

  def get_message(message_id) when is_binary(message_id) do
    # eg. 9aa815d2-3e3b-4bf2-873a-f7ae297db331
    postmark_api_key = System.get_env("POSTMARK_API_KEY")

    Req.get!("https://api.postmarkapp.com/messages/outbound/#{message_id}/details",
      headers: [
        {"X-Postmark-Server-Token", postmark_api_key},
        {"Accept", "application/json"}
      ]
    ).body
  end

  def get_template(nil), do: {:error, "message_id cannot be nil"}

  def get_template(template_alias) when is_binary(template_alias) do
    # eg. welcome-email
    postmark_api_key = System.get_env("POSTMARK_API_KEY")

    response =
      Req.get!("https://api.postmarkapp.com/templates/#{template_alias}",
        headers: [
          {"X-Postmark-Server-Token", postmark_api_key},
          {"Accept", "application/json"}
        ]
      ).body

    if response["ErrorCode"] do
      {:error, response["Message"]}
    else
      {:ok, response}
    end
  end

  def send_email(template_alias, template_model, %User{} = user) do
    postmark_api_key = System.get_env("POSTMARK_API_KEY")

    case MailTester.Emails.get_or_create_email_version_by_template_alias(template_alias) do
      {:ok, %{email: email, email_version: email_version, template: live_template}} ->
        email_response =
          Req.post!("https://api.postmarkapp.com/email/withTemplate",
            headers: [
              {"X-Postmark-Server-Token", postmark_api_key},
              {"Accept", "application/json"}
            ],
            json: %{
              "From" => "accounts@fairsquaremedicare.com",
              "To" => user.email,
              "TemplateAlias" => template_alias,
              "TemplateModel" => template_model,
              "TrackOpens" => true,
              "TrackLinks" => "HtmlAndText"
            }
          ).body

        email_version_id =
          if email_version.html_body != live_template["HtmlBody"] do
            {:ok, new_email_version} =
              Emails.create_email_version(%{
                html_body: live_template["HtmlBody"],
                text_body: live_template["TextBody"],
                version_description: live_template["Subject"],
                email_id: email.id
              })

            new_email_version.id
          else
            email_version.id
          end

        Emails.create_sent_email(%{
          sent_at: email_response["SubmittedAt"],
          postmark_message_id: email_response["MessageID"],
          user_id: user.id,
          email_version_id: email_version_id
        })

      {:error, message} ->
        Logger.error(message,
          user: user,
          postmark_template: template_alias
        )

        nil
    end
  end

  def send_email(template_alias, template_model, users) when is_list(users) do
    users
    |> Enum.each(fn user ->
      send_email(template_alias, template_model, user)
    end)
  end
end
