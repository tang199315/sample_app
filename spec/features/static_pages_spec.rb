require 'rails_helper'
include ApplicationHelper

describe "Static pages" do
	subject{ page }

	shared_examples_for "all static pages" do
		it { has_css?('h1', :text => heading) }
		it { has_css?('title', :text => full_title(page_title)) }
	end

	describe "Home page" do
		before(:each){ visit root_path}
		let(:heading) { 'Sample App'}
		let(:page_title) { '' }
		it_should_behave_like "all static pages"
		it { has_no_css?('title', :text => '| Home') }
	end

	describe "Help page" do
		before(:each){ visit help_path}
		let(:heading) { 'Help'}
		let(:page_title) { 'Help' }
		it_should_behave_like "all static pages"
	end

	describe "About Page" do
		before(:each){ visit about_path}
		let(:heading) { 'About Us'}
		let(:page_title) { 'About Us' }
		it_should_behave_like "all static pages"
	end

	describe "Contact Page" do
		before(:each){ visit contact_path}
		let(:heading) { 'Contact'}
		let(:page_title) { 'Contact' }
		it_should_behave_like "all static pages"

	end
	
	 	it "should have the right links on the layout" do
	 		visit root_path
	 		click_link "About"
	 		page.has_css?('title', text: full_title('About Us'))

			click_link "Help"
	 		page.has_css?('title', text: full_title('Help'))

			click_link "Contact"
	 		page.has_css?('title', text: full_title('Contact'))

			click_link "Home"
			click_link "Sign up now!"
	 		page.has_css?('title', text: full_title('Sign up'))

			click_link "sample app"
	 		page.has_css?('title', text: full_title('Sign up'))
	 	end

end