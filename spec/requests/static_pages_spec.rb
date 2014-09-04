require 'spec_helper'

describe "Static pages" do
	subject{ page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', :text => heading) }
		it { should have_selector('title', :text => full_title(page_title)) }
	end

	describe "Home page" do
		before(:each){ visit root_path}
		let(:heading) { 'Sample App'}
		let(:page_title) { '' }
		it_should_behave_like "all static pages"
		it { should_not have_selector('title', :text => '| Home') }

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

end