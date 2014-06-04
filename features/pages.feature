
Feature: Pages

	Background:
		Given a user has an account
			And the user has logged in
	
	Scenario: New Page
		Given the user goes to the new page form
		When the user submits the form
		Then there should be a new page
	
	@javascript
	Scenario: Edit Page
		Given the user has already made a page
			And the user chooses to edit a page
		When the user submits the edit form
		Then the page should be edited
	
	
	# I cannot test ajax, but this works: #
	@javascript
	Scenario: Choose Home
		Given the user has already made a page
			And the user visits the home page
		When the user chooses a new home page
		Then the page should be the home page
		
	
	