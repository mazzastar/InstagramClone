class Hashtag < ActiveRecord::Base
	has_and_belongs_to_many :post, uniq: true
	validates :name, uniqueness: true
end
