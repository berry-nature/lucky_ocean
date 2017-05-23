defmodule Ap.ArticleTest do
  use Ap.ModelCase

  alias Ap.Article

  @valid_attrs %{author: "some content", body: "some content", sub_title: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
