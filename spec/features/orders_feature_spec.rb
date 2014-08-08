require 'rails_helper'

describe "orders" do
	let(:post) { create(:post, title: 'Pretty Picture')}
	let(:user) { create(:user, email: 'customer@blah.com')}
	let(:admin) { create(:admin)}
	  
	describe 'orders page' do
	  context 'logged in as admin' do 
	  	before do
	  	  login_as admin, scope: :admin
	  	end

	  	context 'no orders' do
	   		it 'see a message' do 
	   			visit '/orders'
	   			expect(page).to have_content 'No orders yet'
	   		end
	   	end  
	   end

	   context 'not logged in as an admin' do 
	   	it 'prompts to sign in' do 
	   		visit '/orders'
	   		expect(page).to have_content 'sign in'
	   	end
	   end

	   context 'with orders' do
	   	before do
	   		login_as admin, scope: :admin
	   		christmas_day = Date.new(2013,12,25) 
	   		Order.create(id: 1, post: post, user: user, created_at: christmas_day)
	   		visit '/orders'
	   	end
	   	it 'displays the product' do 
	   		expect(page).to have_link 'Pretty Picture'
	   	end
	   	it 'displays the customer email' do
	   		expect(page).to have_content 'customer@blah.com'
	   	end

	   	it 'displays the order no' do
	   		expect(page).to have_content '2512130001'
	   	end
	   end

	end
	
	describe "order emails" do
	   before do 
	   	clear_emails
	   end

	   it 'sends and email with the name and the order id of the pic' do 
	   	Order.create(user: user, post: post)
	   	open_email('customer@blah.com')
	   	expect(current_email).to have_content 'Thanks for order of a print of Pretty Picture'
	   end
	end
end