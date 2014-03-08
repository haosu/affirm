class PostsController < ApplicationController
  before_filter { set_goal(:goal_id) }

  def show
    redirect_to @goal
  end

  def create
    post = Post.new(post_params) do |p|
      p.owner = current_user
      p.goal = @goal
    end

    if post.save
      redirect_to @goal
    else
      render 'goals/show'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
  end

private

  def post_params
    params.require(:post).permit(:content)
  end
end
