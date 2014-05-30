require 'spec_helper'

 describe Post do
 	let(:post) { create(:post)}

  describe "tag_names=" do 
  	describe 'no tags' do 
  			it "does nothing" do 
  			 post.tag_names = " "
  			 expect(post.hashtags).to be_empty
  			end
  	end

  	describe 'one tag' do 
  		it "adds a single tag to the post" do 
  			post.tag_names = "yolo"
  			puts post.hashtags
  			expect(post.hashtags.count).to eq 1
  		end

  		it "prepends the tag with a hash if necessary" do 
  			post.tag_names = "yolo"
  			tag = post.hashtags.last
  			expect(tag.name).to eq '#yolo'
  		end

  		it "doesn't double the hashes" do 
  			post.tag_names="#yolo, yolo"
  			tag=post.hashtags.last
  			expect(tag.name).to eq "#yolo"
  			expect(post.hashtags.count).to eq 1
  		end
  	end

  	describe 'multiple comma-separated tags' do
       it 'adds each tag to the post' do
         post.tag_names = 'yolo, swag'
         expect(post.hashtags.count).to eq 2
       end
     end
 
    describe 'multiple duplicate tags' do
       it 'uses only unique tags' do
         post.tag_names = 'yolo, swag, yolo'
         expect(post.hashtags.count).to eq 2
       end
     end
 
     describe 'reusing tags' do
       let!(:tag) { Hashtag.create(name: '#yolo') }
       it 'reuses tags if they exist' do
         post.tag_names = 'yolo'
         expect(Hashtag.count).to eq 1
         expect(Hashtag.posts).to include post
       end
     end
  end
end
