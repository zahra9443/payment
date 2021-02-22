defmodule PaymentWeb.TransactionView do
  use PaymentWeb, :view
  alias PaymentWeb.TransactionView

  def render("index.json", %{transactions: transactions}) do
    %{data: render_many(transactions, TransactionView, "transaction.json")}
  end

  def render("show.json", %{transaction: transaction}) do
    %{data: render_one(transaction, TransactionView, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{id: transaction.id,
      amount: transaction.amount,
      transaction_type: transaction.transaction_type,
      from_wallet: transaction.from,
      distination_wallet: transaction.distination

    }
  end
end
