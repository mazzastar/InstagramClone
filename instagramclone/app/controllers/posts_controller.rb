class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def index
		@posts = current_user.posts
	end

	def new
		@post= Post.new
		# @user=current_user	
	end

	def create
		# puts params[:post].inspect
		# @post = Post.create(params[:post].permit(:title, :caption))
		@post = current_user.posts.create(params[:post].permit(:title, :caption, :picture))
		redirect_to '/posts'
	end

end
