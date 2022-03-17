class GoalsController < ApplicationController

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to user_path(current_user)
    else
      render partial: "form_goal"
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:name, :objective, :current_value, :achieved, :cancelled)
  end
end
