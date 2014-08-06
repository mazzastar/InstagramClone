When(/^I click the link "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should find the field "(.*?)"$/) do |fieldname|
	find_field(fieldname).value
end

When(/^I fill_in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	fill_in	arg1, with: arg2
end

When(/^I click_on "(.*?)"$/) do |arg1|
	click_on(arg1)
end

When(/^I visit "(.*?)" expecting an error$/) do |arg1|
  
end

Given(/^I am signed in as an admin$/) do
  expect{visit '/admins/sign_up'}.to raise_error
end

When(/^there exists an admin user "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am not signed in as an admin$/) do
  pending # express the regexp above with the code you wish you had
end