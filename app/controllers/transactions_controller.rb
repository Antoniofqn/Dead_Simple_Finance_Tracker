class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def index
    @transaction = Transaction.new
    if (params[:query].present? && params[:query] == "all") || !params[:query].present?
      @transactions = Transaction.all
    else
      @transactions = Transaction.where("type_transaction LIKE ?", params[:query].to_s)
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    if @transaction.save
      redirect_to user_transactions_path
    else
      render partial: "new"
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to user_transactions_path
    else
      render partial: "edit", transaction: @transaction
    end
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
