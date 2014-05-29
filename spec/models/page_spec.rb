require 'spec_helper'

describe Page do
  
	let(:user) { FactoryGirl.create(:user) }
	
	before do
		@page = user.pages.build(content: "Here's a page!",
		 title: "First Page", kind: 'blog')
	end
	
	subject { @page }
	
	it { should respond_to(:content) }
	it { should respond_to(:title) }
	it { should respond_to(:kind) }
	it { should respond_to(:home) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	
	it { should be_valid }
	
	describe 'without a user id' do
		before { @page.user_id = nil }
		
		it { should_not be_valid }
	end
	
	describe 'without a title' do
		before { @page.title = nil }
		
		it { should_not be_valid }
	end
	
	describe 'with an invalid kind' do
		before { @page.kind = 'hello, sailor' }
		
		it { should_not be_valid }
	end
	
end
