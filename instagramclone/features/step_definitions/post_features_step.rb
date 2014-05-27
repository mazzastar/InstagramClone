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