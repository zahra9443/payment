defmodule Payment.Accounts.Transaction do
  use Ecto.Schema
  import Ecto.Changeset
  alias Payment.Accounts.Wallet

  schema "transactions" do
    field :amount, :integer
    field :transaction_type, :integer
    belongs_to :from_wallet, Wallet, foreign_key: :from
    belongs_to :distination_wallet, Wallet, foreign_key: :distination


    timestamps()
  end

  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:transaction_type, :amount , :from , :distination, :user_id])
    |> IO.inspect
    |> validate_required([:transaction_type, :amount])
   end
end
