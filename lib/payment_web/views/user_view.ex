defmodule PaymentWeb.UserView do
  use PaymentWeb, :view
  alias PaymentWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      username: user.username,
      phone_number: user.phone_number,
      email: user.email,
      transaction: render_many(user.transactions, TransactionView, "transaction.json")
      }

  end
end
