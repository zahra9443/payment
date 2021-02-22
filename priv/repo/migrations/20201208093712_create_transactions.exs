defmodule Payment.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :transaction_type, :integer
      add :amount, :integer
      add :from, references(:wallets, on_delete: :nothing)
      add :distination, references(:wallets, on_delete: :nothing)


      timestamps()
    end

  end
end
