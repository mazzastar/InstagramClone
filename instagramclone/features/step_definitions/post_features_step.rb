Given(/^I have no posts$/) do
  # (User.new)
end

Given(/^I am not following anyone$/) do
  # pending # express the regexp above with the code you wish you had
end

Given(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end


Given(/^I am signed in$/) do
  user = User.create(email: 'alex@a.com', password: '12345678', password_confirmation: '12345678')
  login_as user
end

Then(/^I should see the link "(.*?)"$/) do |link|
  expect(page).to have_link(link)
end

When(/^I click on the link "(.*?)"$/) do |link|
  click_on(link)
end

Given(/^I visit "(.*?)"$/) do |page|
  visit page
end

When(/^I click on the button "(.*?)"$/) do |button_name|
   click_on(button_name)
end

When(/^I attach "(.*?)" with "(.*?)"$/) do |fileType, filename|
  attach_file 'Picture', Rails.root.join("./spec/img/#{filename}")
end

Then(/^I shoud see css "(.*?)"$/) do |arg1|
  expect(page).to have_css 'img.uploaded-pic'
end

