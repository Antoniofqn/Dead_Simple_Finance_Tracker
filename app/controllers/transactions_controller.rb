class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    if @transaction.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:type_transaction, :date, :value, :category, :tag)
  end
end
