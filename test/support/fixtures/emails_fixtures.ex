defmodule MailTester.EmailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MailTester.Emails` context.
  """

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        postmark_alias: "some postmark_alias",
        postmark_template_id: 42
      })
      |> MailTester.Emails.create_email()

    email
  end

  @doc """
  Generate a email_version.
  """
  def email_version_fixture(attrs \\ %{}) do
    {:ok, email_version} =
      attrs
      |> Enum.into(%{
        html_body: "some html_body",
        text_body: "some text_body",
        version_description: "some version_description"
      })
      |> MailTester.Emails.create_email_version()

    email_version
  end

  @doc """
  Generate a sent_email.
  """
  def sent_email_fixture(attrs \\ %{}) do
    {:ok, sent_email} =
      attrs
      |> Enum.into(%{
        sent_at: ~N[2022-11-28 18:32:00]
      })
      |> MailTester.Emails.create_sent_email()

    sent_email
  end

  @doc """
  Generate a email_performance.
  """
  def email_performance_fixture(attrs \\ %{}) do
    {:ok, email_performance} =
      attrs
      |> Enum.into(%{
        event_timestamp: ~N[2022-11-28 18:55:00],
        event_type: "some event_type"
      })
      |> MailTester.Emails.create_email_performance()

    email_performance
  end
end
