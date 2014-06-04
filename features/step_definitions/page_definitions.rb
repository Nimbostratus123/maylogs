
# Scenario New Page #

Given /^the user goes to the new page form$/ do
	click_link 'New Page'
end

When /^the user submits the form$/ do
	@count = Page.all.count
	@title = "Here's a page title!"
	
	fill_in 'Title', with: @title
	select 'Custom', from: 'Page Type'
	fill_in 'Content', with: "This is some content"
	
	click_button 'Create Page'
end

Then /^there should be a new page$/ do
	expect(@count + 1).to eq Page.all.count
	@page = Page.find_by_title(@title)
	page.should have_selector "div.page_thumb#page_#{@page.id}"
end


# Scenario Choose Home #

Given /^the user has already made a page$/ do
	@page = @user.pages.create(
		title: 'Hello There',
		content: "How are you doing?",
		home: false,
		kind: 'blog'
	)
end

And /^the user visits the home page$/ do
	visit root_path
end 

When /^the user chooses a new home page$/ do
	find('#home_button').click
	find("#page_#{@page.id}").click
	wait_for_ajax
end

Then /^the page should be the home page$/ do
	Page.find(@page.id).home.should be_true
end


# Scenario Edit Page #

And /^the user chooses to edit a page$/ do
	visit root_path
	find('#edit_button').click
	find("#page_#{@page.id}").click
	wait_for_ajax
end

When /^the user submits the edit form$/ do
	fill_in 'Title', with: 'Best Title Ever'
	fill_in 'Content', with: @page.content
	click_button "Edit Page"
	wait_for_ajax
end

Then /^the page should be edited$/ do
	expect(Page.find(@page.id).title).to eq 'Best Title Ever'
end