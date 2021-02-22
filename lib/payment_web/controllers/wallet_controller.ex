defmodule PaymentWeb.WalletController do
  use PaymentWeb, :controller

  alias Payment.Accounts
  alias Payment.Accounts.Wallet

  action_fallback PaymentWeb.FallbackController

  def index(conn, _params) do
    wallets = Accounts.list_wallets()
    render(conn, "index.json", wallets: wallets)
  end

  def create(conn, %{"wallet" => wallet_params}) do

    with {:ok, %Wallet{} = wallet} <- Accounts.create_wallet(wallet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.wallet_path(conn, :show, wallet))
      |> render("show.json", wallet: wallet)
    end
  end

  def show(conn, %{"id" => id}) do
    wallet = Accounts.get_wallet!(id)
    render(conn, "show.json", wallet: wallet)
  end

  def update(conn, %{"id" => id, "wallet" => wallet_params}) do
    wallet = Accounts.get_wallet!(id)

    with {:ok, wallet} <- Accounts.update_wallet(wallet, wallet_params) do
      render(conn, "show.json", wallet: wallet)
    end
  end

  def delete(conn, %{"id" => id}) do
    wallet = Accounts.get_wallet!(id)

    with {:ok, %Wallet{}} <- Accounts.delete_wallet(wallet) do
      send_resp(conn, :no_content, "")
    end
  end
end
