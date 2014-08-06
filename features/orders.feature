Feature: Orders Admin
In order to be an admin
As an admin
I want to see an orders page

Background: On orders page
 When there exists a user "alex@a.com"
 And there exists an admin user "w@w.com"
 And I have a post by user "alex@a.com"

Scenario: When logged in as admin
Given I am signed in as an admin
When I visit "/orders"
Then I should see "No orders yet"

Scenario: When logged in as admin
Given I am not signed in as an admin
When I visit "/orders"
Then I should see "Sign in"



