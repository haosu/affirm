class AffirmationsController < ApplicationController
  before_filter { set_goal(:goal_id) }

  def index
  end

  def create
    @affirmation = Affirmation.new(affirmation_params) do |a|
      a.affirmer = current_user
      a.goal = @goal
    end

    if @affirmation.save
      CreatePostFromAffirmationService.new(@affirmation).call
      redirect_to @goal
    else
      render 'affirmations/new', goal: @goal, affirmations: @affirmations
    end
  end

  def update
  end

  def destroy
  end

private

  def affirmation_params
    params.require(:affirmation).permit(:reason)
  end
end
