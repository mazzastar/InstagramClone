Feature: Instagram post page
	In order to share media files
	As a user
	I want to post a media file

 Scenario: Visiting the home page for the first time
 	Given I visit the homepage
 	Then I should see "Instagram Clone"


 Scenario: posting a photo for the first time
 Given I am signed in
 And I visit the homepage
 Then I should see the link "New Post"

 Scenario: wanting to post a photo
 Given I am signed in 
 And I visit the homepage
 When I click on the link "New Post"
 Then I should see "New Post to Enter"

 Scenario: entering in a new photo
 Given I am signed in
 And I visit "/posts/new"
 When I fill_in "Title" with "test1"
 And I fill_in "Caption" with "test2"
 And I attach "Picture" with "Sam.jpg"
 And I click on the button "Leave Review"
 Then I should see "test1"
 And I should see "test2"
 And I shoud see css "img.uploaded-pic"




# 	Given I visit the home page
# 	And I haven't posted a photo before
# 	And I am not following anyone
# 	When I post a photo
# 	Then I should see the photo on the home page
