class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @transaction = Transaction.new
  end
end
