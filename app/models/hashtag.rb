class Hashtag < ActiveRecord::Base
	has_and_belongs_to_many :posts, uniq: true
	validates :name, uniqueness: true

	def to_param
		name.delete('#')
	end
end
