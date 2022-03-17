class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @transaction = Transaction.new
    @goal = Goal.new
  end
end
