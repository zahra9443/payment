defmodule Payment.Repo.Migrations.CreateWallets do
  use Ecto.Migration

  def change do
    create table(:wallets) do
      add :balance, :integer
      add :wallet_number, :string
      add :user_id, references(:users, on_delete: :delete_all),
                    null: false

      timestamps()
    end

    create unique_index(:wallets, [:wallet_number])
    create index(:wallets, [:user_id])

  end
end
