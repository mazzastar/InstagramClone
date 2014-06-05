When(/^I have a post by user "(.*?)"$/) do |username|
  # user = create(:user)  
  user = User.find_by(email: username)
  login_as user
  @post = user.posts.create(title: "TestTitle", caption: "TestCaption", tag_names: "testTag1, testTag2")
  logout(:user)
end

When(/^there exists a user "(.*?)"$/) do |username|
  user = User.create(email: username, password: '12345678', password_confirmation: '12345678')
end

When(/^I click on "(.*?)"$/) do |arg1|
	click_on arg1
end

When(/^I wait for "(.*?)" seconds$/) do |seconds|
	sleep(seconds.to_i)
	# p page.source
end

Given(/^a post has been liked by "(.*?)"$/) do |arg1|
	user = User.find_by(email: arg1)
	login_as user
	@post = create(:post)
	@post.likes.create(user: user)
end

Given(/^I am logged in as "(.*?)"$/) do |email|
	 user = User.find_by(email: email)
	 login_as user
	# @post = user.posts.last
	# @post.likes.create()
	# pending 
end

Then(/^I should not see the link "(.*?)"$/) do |arg1|
  expect(page).not_to have_link arg1
end