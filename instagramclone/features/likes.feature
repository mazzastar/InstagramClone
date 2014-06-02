Feature: Instagram Like
In order to show appreciation of post
As a user
I want to like a post

Background: On the homepage with a photo
 When there exists a user "alex@a.com"
 And there exists a user "alex2@a2.com"
 And I have a post by user "alex@a.com"

Scenario: A new post has no new likes
Given I am signed in as an existing user
When I visit "/posts"
Then I should see the link "♥ 0"

Scenario: A user clicks like on a post
Given  I am signed in as an existing user
And I visit "/posts"
When I click on "♥ 0"
Then I should not see the link "♥ 0" 
And I should see the link "♥ 1"

Scenario: A user can undo a like.
Given  I am signed in as an existing user
When I visit "/posts"
And I click on "♥ 0"
And I click on "♥ 1"
Then I should see the link "♥ 0"

Scenario: Another user can see a post that has been liked
Given a post has been liked by "alex@a.com"
And I am logged in as "alex2@a2.com"
When I visit "/posts"
Then I should see the link "♥ 1"

Scenario: Another user can like a post that has been liked
Given a post has been liked by "alex@a.com"
And I am logged in as "alex2@a2.com"
When I visit "/posts"
And I click on "♥ 1"
Then I should see the link "♥ 2"

Scenario: Another user can unlike a post that has been liked
Given a post has been liked by "alex@a.com"
And I am logged in as "alex2@a2.com"
When I visit "/posts"
And I click on "♥ 1"
And I click on "♥ 2"
Then I should see the link "♥ 1"


