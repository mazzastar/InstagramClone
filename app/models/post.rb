class Post < ActiveRecord::Base


	has_attached_file :picture, 
		styles: {medium: '300x300>'},
		storage: :s3,
		s3_credentials:{
			bucket: 'pimpstagram',
			access_key_id: Rails.application.secrets.s3_access_key,
			secret_access_key: Rails.application.secrets.s3_secret_key
		}, 
		:default_url => "Ghost.png"

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	belongs_to :user
	has_and_belongs_to_many :hashtags, uniq: true
	has_many :likes

	def tag_names=(text)
		
		return if text.blank?

		text.scan(/\w+/).each do |tagEntry| 	
			formattedText = '#' + tagEntry
			tag = Hashtag.find_or_create_by(name: formattedText)
			hashtags << tag unless self.hashtags.include?(tag)
		end
	end

	def tag_names
		''		
	end
end
