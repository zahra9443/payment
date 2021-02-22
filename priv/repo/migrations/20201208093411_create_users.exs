defmodule Payment.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :phone_number, :string
      add :email, :string

      timestamps()
    end
    create unique_index(:users, [:username])
    create unique_index(:users, [:phone_number])
    create unique_index(:users, [:email])

  end
end
