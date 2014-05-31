class Hashtag < ActiveRecord::Base
	has_and_belongs_to_many :posts, uniq: true
	validates :name, uniqueness: true

	def hashtags
		hashtags = Tags
		
	end
end
