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
		puts params[:post]
		@post = current_user.posts.create!(params[:post].permit(:title, :caption, :picture, :tag_names, :address))
		redirect_to '/posts'
	end

	def destroy
		@post=current_user.posts.find(params[:id])
		@post.destroy	
		flash[:notice]="Deleted Post"
		redirect_to '/posts'
	end

	def show
		@post = Post.find(params[:id])
	end

end
