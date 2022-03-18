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

  def edit
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.current_value = @goal.current_value + params["goal"]["current_value"].to_i
    @goal.save
      if @goal.current_value > @goal.objective
        @goal.achieve!
        redirect_to user_path(current_user), notice: "Congratulations! You've achieved your goal!"
      else
        redirect_to user_path(current_user)
      end
  end

  def cancel
    goal = current_user.goals.last
    goal.cancel!
    redirect_to user_path(current_user), notice: "Goal cancelled!"
  end


  private

  def goal_params
    params.require(:goal).permit(:name, :objective, :current_value, :achieved, :cancelled)
  end
end
