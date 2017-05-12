# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ap.Repo.insert!(%Ap.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Ap.Repo.delete_all Ap.User

Ap.User.changeset(%Ap.User{}, %{name: "幸福海", email: "lucky@oceanic.com", password: "secret", password_confirmation: "secret"})
|> Ap.Repo.insert!