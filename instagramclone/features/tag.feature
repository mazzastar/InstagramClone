Feature: Add hashtags to Post
	In order to add metadata to each post
	As a user
	I want to add a hashtag in a caption



Background: On the homepage with a photo
 When I am signed in
 And I visit "/posts/new"
 And I fill_in "Title" with "test1"
 And I fill_in "Caption" with "test2"
 And I attach "Picture" with "Sam.jpg"

Scenario: The Post caption has no hashtags
When I fill_in the "Hashtags" area with "excellent party"
And I click on the button "Create Post"
Then I should see link "#excellent"
And I should see link "#party"

Scenario: It can filter posts by tag
	When I am signed in 
	And I have a post called "Yolo1" and a photo "Sam.jpg"
	And I have a post called "Yolo2" and a photo "Sam.jpg"
	And I visit "/p"
