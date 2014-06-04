class HashtagsController < ApplicationController

	def show
		@hashtag = Hashtag.find_by(name: '#' +params[:id])
		@posts = @hashtag.posts
	end



end

