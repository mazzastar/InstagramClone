module LikesHelper

	def liked?(post, current_user)
		 post.likes.map{|like| like.user_id}.include?(current_user.id)
	end
	
end
