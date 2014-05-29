
Feature: Pages

	Background:
		Given a user has an account
			And the user has logged in
	
	Scenario: New Page
		Given the user goes to the new page form
		When the user submits the form
		Then there should be a new page
	
	# Scenario: Edit Page
	# 	Given the user clicks on a page
	# 	When the user submits the edit form
	# 	Then the page should be edited
	# 
	# 
	# Scenario: Choose Home
	# 	When the user chooses a new home page
	# 	Then the page should be the home page
	# 	
	
	#Scenario: Customize Style
	
	
	
  # Scenario: Unsucessful Update
  # Given a user has an account
  # 	And the user has logged in
  # 	And the user visits the edit page
  # When they submit invalid information
  # Then they should see errors
  # 
  # Scenario: Successful Update
  # Given a user has an account
  # 	And the user has logged in
  # 	And the user visits the edit page
  # When they submit valid information
  # Then they should see a success flash
  # 	And they should have new information
  # 	
  # Scenario: Malicious Attack
  # Given an anonymous user
  # When they submit a put request without authorization
  # Then they should be asked to log in