defmodule Ap.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :sub_title, :string
      add :author, :string
      add :body, :text

      timestamps()
    end

  end
end
