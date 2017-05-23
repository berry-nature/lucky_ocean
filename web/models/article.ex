defmodule Ap.Article do
  use Ap.Web, :model

  schema "articles" do
    field :title, :string
    field :sub_title, :string
    field :author, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :sub_title, :author, :body])
    |> validate_required([:title, :sub_title, :author, :body])
  end
end
