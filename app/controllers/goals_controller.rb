class GoalsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_goal, except: %i(index create)

  def index
  end

  def show
  end

  def new
  end

  def create
    goal = Goal.new(goal_params) do |g|
      g.owner = current_user
    end

    if goal.save
      redirect_to goal
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to @goal
    else
      render 'edit'
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

private

  def set_goal
    @goal =
      if id = params[:id]
        Goal.find(id)
      else
        Goal.new
      end
  end

  def goal_params
    params.require(:goal).permit(:name, :reason, :critical_mass)
  end
end
