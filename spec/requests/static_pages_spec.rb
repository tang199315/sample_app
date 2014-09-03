require 'spec_helper'
	describe "Static pages" do

	describe "Home page" do
		let(:title) { "Ruby on Rails Tutorial Sample App " }

		it "should have the content 'Sample App'" do
		visit root_path
		page.should have_selector('h1',
									:text => 'Sample App')
		end

		it "should have the title 'Home'" do
		visit root_path
		page.should have_selector('title',
									:text => title + '| Home')
		end

	end

	describe "Help page" do
		let(:title) { "Ruby on Rails Tutorial Sample App " }

		it "should have the content 'Help'" do
		visit help_path
		page.should have_selector('h1',
									:text => 'Help')
		end

		it "should have the title 'Help'" do
		visit help_path
		page.should have_selector('title',
									:text => title + '| Help')
		end

	end

	describe "About Page" do
		let(:title) { "Ruby on Rails Tutorial Sample App " }
		it "should have the content 'About us'" do
		visit about_path
		page.should have_selector('h1',
									:text => 'About Us')
		end
		
		it "should have the title 'About Us'" do
		visit about_path
		page.should have_selector('title',
									:text => title + '| About Us')
		end

	end

	describe "Contact Page" do
		let(:title) { "Ruby on Rails Tutorial Sample App " }
		it "should have the content 'Contact'" do
		visit contact_path
		page.should have_selector('h1',
									:text => 'Contact')
		end
		
		it "should have the title 'Contact'" do
		visit contact_path
		page.should have_selector('title',
									:text => title + '| Contact')
		end

	end

end