
When(/^I fill_in the "(.*?)" area with "(.*?)"$/) do |hashtagArea, text|
	fill_in	hashtagArea, with: text
end

Then(/^I should see link "(.*?)"$/) do |hashtag|
  expect(page).to have_link hashtag
end