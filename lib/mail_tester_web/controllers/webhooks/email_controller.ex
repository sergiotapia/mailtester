defmodule MailTesterWeb.Webhooks.EmailController do
  use MailTesterWeb, :controller
  alias MailTester.Emails

  def emails(conn, params) do
    sent_email = Emails.get_sent_email_by_postmark_message_id!(params["MessageID"])

    event_type =
      case params["RecordType"] do
        "Open" ->
          :opened

        "Click" ->
          :clicked
      end

    {:ok, event_timestamp, 0} = DateTime.from_iso8601(params["ReceivedAt"])

    {:ok, _event_performance} =
      Emails.create_email_performance(%{
        event_type: event_type,
        event_timestamp: event_timestamp,
        sent_email_id: sent_email.id
      })

    text(conn, "OK")
  end
end
