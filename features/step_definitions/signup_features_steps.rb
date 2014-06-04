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
