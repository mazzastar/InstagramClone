
When(/^I fill_in the "(.*?)" area with "(.*?)"$/) do |hashtagArea, text|
	fill_in	hashtagArea, with: text
end

Then(/^I should see link "(.*?)"$/) do |hashtag|
  expect(page).to have_link hashtag
end

Given(/^there exists a post called "(.*?)" and a photo "(.*?)"$/) do |tagname, photo|
  steps %{
     When I visit "/posts/new"
 	 And I fill_in "Title" with "tagname"
 	 And I fill_in "Caption" with "tagname"
 	 And I attach "Picture" with "#{photo}"
 	 And I fill_in the "Hashtags" area with "#{tagname}"
	 And I click on the button "Create Post"
  }
end



Then(/^I should expect to have content "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I should expect not to have content "(.*?)"$/) do |text|
  expect(page).not_to have_content text
end

Then(/^I should expect to have css "(.*?)", "(.*?)", "(.*?)"$/) do |tag, attribute, argument|
	expect(page).to have_css "#{tag}", "#{attribute}:"+"#{argument}"
end