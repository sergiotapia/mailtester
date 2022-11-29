defmodule MailTester.Emails do
  @moduledoc """
  The Emails context.
  """

  import Ecto.Query, warn: false
  alias MailTester.Repo

  alias MailTester.Emails.Email

  @doc """
  Returns the list of emails.

  ## Examples

      iex> list_emails()
      [%Email{}, ...]

  """
  def list_emails do
    Repo.all(Email)
  end

  @doc """
  Gets a single email.

  Raises `Ecto.NoResultsError` if the Email does not exist.

  ## Examples

      iex> get_email!(123)
      %Email{}

      iex> get_email!(456)
      ** (Ecto.NoResultsError)

  """
  def get_email!(id), do: Repo.get!(Email, id)

  @doc """
  Creates a email.

  ## Examples

      iex> create_email(%{field: value})
      {:ok, %Email{}}

      iex> create_email(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_email(attrs \\ %{}) do
    %Email{}
    |> Email.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a email.

  ## Examples

      iex> update_email(email, %{field: new_value})
      {:ok, %Email{}}

      iex> update_email(email, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_email(%Email{} = email, attrs) do
    email
    |> Email.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a email.

  ## Examples

      iex> delete_email(email)
      {:ok, %Email{}}

      iex> delete_email(email)
      {:error, %Ecto.Changeset{}}

  """
  def delete_email(%Email{} = email) do
    Repo.delete(email)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking email changes.

  ## Examples

      iex> change_email(email)
      %Ecto.Changeset{data: %Email{}}

  """
  def change_email(%Email{} = email, attrs \\ %{}) do
    Email.changeset(email, attrs)
  end

  alias MailTester.Emails.EmailVersion

  @doc """
  Returns the list of email_versions.

  ## Examples

      iex> list_email_versions()
      [%EmailVersion{}, ...]

  """
  def list_email_versions do
    Repo.all(EmailVersion)
  end

  @doc """
  Gets a single email_version.

  Raises `Ecto.NoResultsError` if the Email version does not exist.

  ## Examples

      iex> get_email_version!(123)
      %EmailVersion{}

      iex> get_email_version!(456)
      ** (Ecto.NoResultsError)

  """
  def get_email_version!(id), do: Repo.get!(EmailVersion, id)

  @doc """
  Creates a email_version.

  ## Examples

      iex> create_email_version(%{field: value})
      {:ok, %EmailVersion{}}

      iex> create_email_version(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_email_version(attrs \\ %{}) do
    %EmailVersion{}
    |> EmailVersion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a email_version.

  ## Examples

      iex> update_email_version(email_version, %{field: new_value})
      {:ok, %EmailVersion{}}

      iex> update_email_version(email_version, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_email_version(%EmailVersion{} = email_version, attrs) do
    email_version
    |> EmailVersion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a email_version.

  ## Examples

      iex> delete_email_version(email_version)
      {:ok, %EmailVersion{}}

      iex> delete_email_version(email_version)
      {:error, %Ecto.Changeset{}}

  """
  def delete_email_version(%EmailVersion{} = email_version) do
    Repo.delete(email_version)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking email_version changes.

  ## Examples

      iex> change_email_version(email_version)
      %Ecto.Changeset{data: %EmailVersion{}}

  """
  def change_email_version(%EmailVersion{} = email_version, attrs \\ %{}) do
    EmailVersion.changeset(email_version, attrs)
  end

  alias MailTester.Emails.SentEmail

  @doc """
  Returns the list of sent_emails.

  ## Examples

      iex> list_sent_emails()
      [%SentEmail{}, ...]

  """
  def list_sent_emails do
    Repo.all(SentEmail)
  end

  @doc """
  Gets a single sent_email.

  Raises `Ecto.NoResultsError` if the Sent email does not exist.

  ## Examples

      iex> get_sent_email!(123)
      %SentEmail{}

      iex> get_sent_email!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sent_email!(id), do: Repo.get!(SentEmail, id)

  @doc """
  Creates a sent_email.

  ## Examples

      iex> create_sent_email(%{field: value})
      {:ok, %SentEmail{}}

      iex> create_sent_email(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sent_email(attrs \\ %{}) do
    %SentEmail{}
    |> SentEmail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sent_email.

  ## Examples

      iex> update_sent_email(sent_email, %{field: new_value})
      {:ok, %SentEmail{}}

      iex> update_sent_email(sent_email, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sent_email(%SentEmail{} = sent_email, attrs) do
    sent_email
    |> SentEmail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sent_email.

  ## Examples

      iex> delete_sent_email(sent_email)
      {:ok, %SentEmail{}}

      iex> delete_sent_email(sent_email)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sent_email(%SentEmail{} = sent_email) do
    Repo.delete(sent_email)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sent_email changes.

  ## Examples

      iex> change_sent_email(sent_email)
      %Ecto.Changeset{data: %SentEmail{}}

  """
  def change_sent_email(%SentEmail{} = sent_email, attrs \\ %{}) do
    SentEmail.changeset(sent_email, attrs)
  end

  alias MailTester.Emails.EmailPerformance

  @doc """
  Returns the list of email_performances.

  ## Examples

      iex> list_email_performances()
      [%EmailPerformance{}, ...]

  """
  def list_email_performances do
    Repo.all(EmailPerformance)
  end

  @doc """
  Gets a single email_performance.

  Raises `Ecto.NoResultsError` if the Email performance does not exist.

  ## Examples

      iex> get_email_performance!(123)
      %EmailPerformance{}

      iex> get_email_performance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_email_performance!(id), do: Repo.get!(EmailPerformance, id)

  @doc """
  Creates a email_performance.

  ## Examples

      iex> create_email_performance(%{field: value})
      {:ok, %EmailPerformance{}}

      iex> create_email_performance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_email_performance(attrs \\ %{}) do
    %EmailPerformance{}
    |> EmailPerformance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a email_performance.

  ## Examples

      iex> update_email_performance(email_performance, %{field: new_value})
      {:ok, %EmailPerformance{}}

      iex> update_email_performance(email_performance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_email_performance(%EmailPerformance{} = email_performance, attrs) do
    email_performance
    |> EmailPerformance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a email_performance.

  ## Examples

      iex> delete_email_performance(email_performance)
      {:ok, %EmailPerformance{}}

      iex> delete_email_performance(email_performance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_email_performance(%EmailPerformance{} = email_performance) do
    Repo.delete(email_performance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking email_performance changes.

  ## Examples

      iex> change_email_performance(email_performance)
      %Ecto.Changeset{data: %EmailPerformance{}}

  """
  def change_email_performance(%EmailPerformance{} = email_performance, attrs \\ %{}) do
    EmailPerformance.changeset(email_performance, attrs)
  end
end
