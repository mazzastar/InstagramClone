Feature: Add hashtags to Post
	In order to add metadata to each post
	As a user
	I want to add a hashtag in a caption



Background: On the homepage with a photo
 When I am signed in
 And I visit "/posts/new"
 And I fill_in "Title" with "Yolo1"
 And I fill_in "Caption" with "Yolo1"
 And I attach "Picture" with "Sam.jpg"

Scenario: The Post caption has a hashtags
When I fill_in the "Hashtags" area with "Yolo1, party"
And I click on the button "Create Post"
Then I should see link "#Yolo1"
And I should see link "#party"

Scenario: It can filter posts by tag
	Given there exists a post called "Yolo1" and a photo "Sam.jpg"
	And there exists a post called "Yolo2" and a photo "Sam2.jpg"
	And I visit "/posts"
	When I click on the link "Yolo1"
	Then I should expect to have css "h1", "text:", "Posts tagged with Yolo"
	And I should expect to have content "Yolo1"
	And I should expect not to have content "Yolo2"


