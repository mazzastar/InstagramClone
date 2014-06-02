class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def index
		# @posts = current_user.posts
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(params[:post].permit(:title, :caption, :picture, :tag_names))
		redirect_to '/posts'
	end

	def destroy
		@post=current_user.posts.find(params[:id])
		@post.destroy	
		flash[:notice]="Deleted Post"
		redirect_to '/posts'
	end

end
