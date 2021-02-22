defmodule Payment.Accounts.Wallet do
  use Ecto.Schema
  import Ecto.Changeset

   schema "wallets" do
    field :balance, :integer
    field :wallet_number, :string
    belongs_to :user, Payment.Accounts.User



    timestamps()
  end

  @doc false
  def changeset(wallet, attrs) do
    wallet
    |> cast(attrs, [:balance, :wallet_number, :user_id])
    |> validate_required([:balance, :wallet_number, :user_id])
    |> unique_constraint(:wallet_number)
  end
end
