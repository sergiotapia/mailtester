defmodule MailTester.EmailsTest do
  use MailTester.DataCase

  alias MailTester.Emails

  describe "emails" do
    alias MailTester.Emails.Email

    import MailTester.EmailsFixtures

    @invalid_attrs %{postmark_alias: nil, postmark_template_id: nil}

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Emails.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Emails.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      valid_attrs = %{postmark_alias: "some postmark_alias", postmark_template_id: 42}

      assert {:ok, %Email{} = email} = Emails.create_email(valid_attrs)
      assert email.postmark_alias == "some postmark_alias"
      assert email.postmark_template_id == 42
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      update_attrs = %{postmark_alias: "some updated postmark_alias", postmark_template_id: 43}

      assert {:ok, %Email{} = email} = Emails.update_email(email, update_attrs)
      assert email.postmark_alias == "some updated postmark_alias"
      assert email.postmark_template_id == 43
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Emails.update_email(email, @invalid_attrs)
      assert email == Emails.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Emails.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Emails.change_email(email)
    end
  end

  describe "email_versions" do
    alias MailTester.Emails.EmailVersion

    import MailTester.EmailsFixtures

    @invalid_attrs %{html_body: nil, text_body: nil, version_description: nil}

    test "list_email_versions/0 returns all email_versions" do
      email_version = email_version_fixture()
      assert Emails.list_email_versions() == [email_version]
    end

    test "get_email_version!/1 returns the email_version with given id" do
      email_version = email_version_fixture()
      assert Emails.get_email_version!(email_version.id) == email_version
    end

    test "create_email_version/1 with valid data creates a email_version" do
      valid_attrs = %{
        html_body: "some html_body",
        text_body: "some text_body",
        version_description: "some version_description"
      }

      assert {:ok, %EmailVersion{} = email_version} = Emails.create_email_version(valid_attrs)
      assert email_version.html_body == "some html_body"
      assert email_version.text_body == "some text_body"
      assert email_version.version_description == "some version_description"
    end

    test "create_email_version/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email_version(@invalid_attrs)
    end

    test "update_email_version/2 with valid data updates the email_version" do
      email_version = email_version_fixture()

      update_attrs = %{
        html_body: "some updated html_body",
        text_body: "some updated text_body",
        version_description: "some updated version_description"
      }

      assert {:ok, %EmailVersion{} = email_version} =
               Emails.update_email_version(email_version, update_attrs)

      assert email_version.html_body == "some updated html_body"
      assert email_version.text_body == "some updated text_body"
      assert email_version.version_description == "some updated version_description"
    end

    test "update_email_version/2 with invalid data returns error changeset" do
      email_version = email_version_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Emails.update_email_version(email_version, @invalid_attrs)

      assert email_version == Emails.get_email_version!(email_version.id)
    end

    test "delete_email_version/1 deletes the email_version" do
      email_version = email_version_fixture()
      assert {:ok, %EmailVersion{}} = Emails.delete_email_version(email_version)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_email_version!(email_version.id) end
    end

    test "change_email_version/1 returns a email_version changeset" do
      email_version = email_version_fixture()
      assert %Ecto.Changeset{} = Emails.change_email_version(email_version)
    end
  end

  describe "sent_emails" do
    alias MailTester.Emails.SentEmail

    import MailTester.EmailsFixtures

    @invalid_attrs %{sent_at: nil}

    test "list_sent_emails/0 returns all sent_emails" do
      sent_email = sent_email_fixture()
      assert Emails.list_sent_emails() == [sent_email]
    end

    test "get_sent_email!/1 returns the sent_email with given id" do
      sent_email = sent_email_fixture()
      assert Emails.get_sent_email!(sent_email.id) == sent_email
    end

    test "create_sent_email/1 with valid data creates a sent_email" do
      valid_attrs = %{sent_at: ~N[2022-11-28 18:32:00]}

      assert {:ok, %SentEmail{} = sent_email} = Emails.create_sent_email(valid_attrs)
      assert sent_email.sent_at == ~N[2022-11-28 18:32:00]
    end

    test "create_sent_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_sent_email(@invalid_attrs)
    end

    test "update_sent_email/2 with valid data updates the sent_email" do
      sent_email = sent_email_fixture()
      update_attrs = %{sent_at: ~N[2022-11-29 18:32:00]}

      assert {:ok, %SentEmail{} = sent_email} = Emails.update_sent_email(sent_email, update_attrs)
      assert sent_email.sent_at == ~N[2022-11-29 18:32:00]
    end

    test "update_sent_email/2 with invalid data returns error changeset" do
      sent_email = sent_email_fixture()
      assert {:error, %Ecto.Changeset{}} = Emails.update_sent_email(sent_email, @invalid_attrs)
      assert sent_email == Emails.get_sent_email!(sent_email.id)
    end

    test "delete_sent_email/1 deletes the sent_email" do
      sent_email = sent_email_fixture()
      assert {:ok, %SentEmail{}} = Emails.delete_sent_email(sent_email)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_sent_email!(sent_email.id) end
    end

    test "change_sent_email/1 returns a sent_email changeset" do
      sent_email = sent_email_fixture()
      assert %Ecto.Changeset{} = Emails.change_sent_email(sent_email)
    end
  end

  describe "email_performances" do
    alias MailTester.Emails.EmailPerformance

    import MailTester.EmailsFixtures

    @invalid_attrs %{event_timestamp: nil, event_type: nil}

    test "list_email_performances/0 returns all email_performances" do
      email_performance = email_performance_fixture()
      assert Emails.list_email_performances() == [email_performance]
    end

    test "get_email_performance!/1 returns the email_performance with given id" do
      email_performance = email_performance_fixture()
      assert Emails.get_email_performance!(email_performance.id) == email_performance
    end

    test "create_email_performance/1 with valid data creates a email_performance" do
      valid_attrs = %{event_timestamp: ~N[2022-11-28 18:55:00], event_type: "some event_type"}

      assert {:ok, %EmailPerformance{} = email_performance} =
               Emails.create_email_performance(valid_attrs)

      assert email_performance.event_timestamp == ~N[2022-11-28 18:55:00]
      assert email_performance.event_type == "some event_type"
    end

    test "create_email_performance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email_performance(@invalid_attrs)
    end

    test "update_email_performance/2 with valid data updates the email_performance" do
      email_performance = email_performance_fixture()

      update_attrs = %{
        event_timestamp: ~N[2022-11-29 18:55:00],
        event_type: "some updated event_type"
      }

      assert {:ok, %EmailPerformance{} = email_performance} =
               Emails.update_email_performance(email_performance, update_attrs)

      assert email_performance.event_timestamp == ~N[2022-11-29 18:55:00]
      assert email_performance.event_type == "some updated event_type"
    end

    test "update_email_performance/2 with invalid data returns error changeset" do
      email_performance = email_performance_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Emails.update_email_performance(email_performance, @invalid_attrs)

      assert email_performance == Emails.get_email_performance!(email_performance.id)
    end

    test "delete_email_performance/1 deletes the email_performance" do
      email_performance = email_performance_fixture()
      assert {:ok, %EmailPerformance{}} = Emails.delete_email_performance(email_performance)

      assert_raise Ecto.NoResultsError, fn ->
        Emails.get_email_performance!(email_performance.id)
      end
    end

    test "change_email_performance/1 returns a email_performance changeset" do
      email_performance = email_performance_fixture()
      assert %Ecto.Changeset{} = Emails.change_email_performance(email_performance)
    end
  end
end
