
Feature: Posts

	Background:
		Given a user has an account
			And the user has logged in
			And the user visits their blog
	
	Scenario: New Post - With Information
		Given the user filled in the form properly
		When the user submits the new post form
		Then there should be a new post

	Scenario: New Post - Without Information
		Given the user filled in the form improperly
		When the user submits the new post form
		Then there should not be a new post
	
	# Scenario: Edit Post
	# 	Given the user edits their post
	# 	When the user submits the edit post form
	# 	Then the post should be edited
	
	# Scenario: Delete Post
	# 	Given the user has a post
	# 	When the user deletes the post
	# 	Then the post should be deleted
	
