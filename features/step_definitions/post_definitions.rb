
# Scenario New Post - With Information #

And /^the user visits their blog$/ do
	@page = @user.pages.create(
		title: 'Hello There',
		content: "How are you doing?",
		home: false,
		kind: 'blog'
	)
	
	visit display_page_path(@page)
	
end

Given /^the user filled in the form properly$/ do
	fill_in 'title', with: 'Hello'
	fill_in 'content', with: 'How are you doing there?'
end

When /^the user submits the new post form$/ do
	@count = Post.all.count
	click_button 'Submit'
end

Then /^there should be a new post$/ do
	expect(Post.count == @count + 1).to be_true
end


# Scenario New Post - Without Information #

Given /^the user filled in the form improperly$/ do
	fill_in 'content', with: 'How are you doing there?'
end

Then /^there should not be a new post$/ do
	expect(Post.count == @count).to be_true
end