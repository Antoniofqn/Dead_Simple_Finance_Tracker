class TransactionsController < ApplicationController
  def index
    @transaction = Transaction.new
    if (params[:query].present? && params[:query] == "all") || !params[:query].present?
      @transactions = current_user.transactions
    else
      @transactions = current_user.transactions.where("type_transaction LIKE ?", params[:query].to_s)
    end
  end

  def new
    @transaction = Transaction.new
    @elem = params[:elem]
    session[:passed_variable] = @elem
  end

  def create
    @elem = session[:passed_variable]
    @transaction = Transaction.new
    @transaction.assign_attributes(transaction_params)
    @transaction.user = current_user
    @transaction.save
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.assign_attributes(transaction_params)
    @changed = @transaction.changed?
    @transaction.save
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to user_transactions_path(current_user)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:type_transaction, :date, :value, :category, :tag)
  end
end
