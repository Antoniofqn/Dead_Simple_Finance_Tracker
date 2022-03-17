class GoalsController < ApplicationController

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to user_path
    else
      render partial: "form_goal"
    end
  end

end
