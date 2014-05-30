class Post < ActiveRecord::Base


	has_attached_file :picture , styles: {medium: '300x300>'}
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_and_belongs_to_many :hashtags, uniq: true

	def tag_names=(text)
		
		return if text.blank?

		# text.scan(/\w+/).uniq.each do |tagentry| 
		text.scan(/\w+/).each do |tagentry| 	
			formattedText = '#' + tagentry
			tag = Hashtag.find_or_create_by(name: formattedText)
			hashtags << tag unless self.hashtags.include?(tag)
		end
	end

	def tag_names
		''		
	end
end
