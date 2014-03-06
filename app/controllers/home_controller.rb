class HomeController < ApplicationController
  layout 'public'

  skip_before_filter :authenticate_user!
  before_filter :redirect_to_goals

  def index
  end

private

  def redirect_to_goals
    redirect_to goals_path if user_signed_in?
  end
end
