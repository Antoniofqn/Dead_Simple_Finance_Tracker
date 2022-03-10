class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save
  end

  private

  def computer_params
    params.require(:transaction).permit(:type_transaction, :date, :value, :category, :tag)
  end

end
