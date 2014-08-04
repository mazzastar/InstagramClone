class LikesController < ApplicationController
  def create
  	@post = Post.find params[:post_id]
  	@like = @post.likes.create(user_id: current_user.id)
  	# WebsocketRails[:likes].trigger 'new', {id: @post.id, new_like_count: @post.likes.count, like_id: @post.likes.last.id}
    WebsocketRails[:likes].trigger 'new', {id: @post.id, new_like_count: @post.likes.count, like_id: @like.id}
    render nothing: true

  	 # redirect_to '/posts'
  end


  def index
  	redirect_to '/posts'
  end

  # def new
  # en

  def destroy
  	@post = Post.find(params[:post_id])
  	@link = @post.likes.find_by(user_id: current_user.id)
  	@link.destroy
  	WebsocketRails[:likes].trigger 'destroy', {id: @post.id, new_like_count: @post.likes.count}
    render nothing: true

  	# redirect_to '/posts'
  end
end



