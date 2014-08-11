require 'rails_helper'

describe "posts" do
	# let(:post) { create(:post, title: 'Pretty Picture')}
	let(:user) { create(:user, email: 'customer@blah.com')}
	 
	before do 
		login_as user	
	end

	describe 'maps for posts' do 
		it 'shows a map button if a post has an address' do 
			create(:post, address: '25 City Road, London')			
			visit '/posts'
			expect(page).to have_link "Map"
		end

		it 'does not show a map button for a post without an address' do 
			create(:post)
			visit '/posts'
			expect(page).not_to have_link 'Map'
		end
	end
	  
end