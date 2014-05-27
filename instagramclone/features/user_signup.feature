Feature: The sign up page
	In order to log into Instagram
	As a new user
	I want to be able to create a new account

	Scenario: Signing up for the first time
		Given I visit the homepage
		When I click_on "Sign up"
		And I fill_in "Email" with "alex@a.com"
		And I fill_in "Password" with "password1"
		And I fill_in "Password confirmation" with "password1"
		And I click_on "Sign up"
		Then I should see "Welcome alex@a.com"
		And I should see "There are no posts yet"
