Feature: Stripe Admin
In order to be an admin
As an admin
I want to like a post

Background: On the homepage with a photo
 When there exists a user "alex@a.com"
 And there exists a user "alex2@a2.com"
 And I have a post by user "alex@a.com"

Scenario: A new post has no new likes
Given I am signed in as an admin
When I visit "/admins/sign_up" expecting an error
Then I should not see the link "sign up"
