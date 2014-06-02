class LikesController < ApplicationController
  def create
  	@post = Post.find params[:post_id]
  	@post.likes.create(user_id: current_user.id)
  	redirect_to '/posts'
  end

  def index
  end

  def new
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@link = @post.likes.find_by(user_id: current_user.id)
  	@link.destroy
  	redirect_to '/posts'
  end
end



