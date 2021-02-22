defmodule Payment.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Payment.Accounts.{Wallet, Transaction}

  schema "users" do
    field :name, :string
    field :username, :string
    field :phone_number, :string
    field :email, :string
    has_one :wallet, Wallet
    has_many :transactions, Transaction
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :phone_number, :email])
    |> validate_required([:name, :username, :phone_number, :email])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> unique_constraint(:phone_number)
  end
end
