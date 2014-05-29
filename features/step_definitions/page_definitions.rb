
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
	expect(Page.all.count + 1).to equal @count
	@page = Page.find_by_title(@title)
	page.should have_selector "div.page_thumb.page#page_#{@page.id}"
end