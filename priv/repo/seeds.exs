# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MailTester.Repo.insert!(%MailTester.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

MailTester.Repo.insert!(%MailTester.Accounts.User{
  email: "sergiotapiagutierrez@gmail.com",
  hashed_password: "1234"
})
