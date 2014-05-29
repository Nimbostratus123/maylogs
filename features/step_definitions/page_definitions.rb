
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

When /^the user chooses a new home page$/ do
	click_link 'Choose Home'
	@page = Page.all.first
	@page.home = false
	@page.save!
	click_on @page.title
end

Then /^the page should be the home page$/ do
	@page.home.should be_true # or be true?
end