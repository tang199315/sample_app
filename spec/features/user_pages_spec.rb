require 'rails_helper'
include ApplicationHelper

describe "User Pages" do
	subject { page }

	describe "Sign Up Page" do
		before(:each){ visit signup_path}

		it { should have_selector('h1', text: 'Sign up') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "Profile page" do
		let(:user){ FactoryGirl.create(:user) }
		before { visit user_path(user) }
		
		it { should have_title(user.name) }
		it { should have_selector('h1', text: user.name) }
	end

#Data Validation
	describe "sign up" do
		before(:each) { visit signup_path }
		let(:submit) { "Create my account" }

		describe "with invalid info" do
			it "should not create a new user" do
				expect{ click_button submit}.not_to change(User, :count) 
			end

			describe "after submission" do
				before { click_button submit }
				it "should have error messages" do
					should have_title('Sign up')
					should have_content('error')
				end
			end

		end

		describe "with valid info" do
			before do
				fill_in "Name", 		with: 'Testing'
				fill_in "Email",		with: 'testing@example.com'
				fill_in "Password",		with: 'foobar'
				fill_in "Confirmation",	with: 'foobar'
			end
			it "should create a user" do
				expect{ click_button submit}.to change(User, :count).by(1)
			end

			it "should redirect to profile page" do
				click_button submit
				should have_title('Testing')
				should have_selector('h1', text: 'Testing')
				should have_content('Welcome')
				should have_link('Sign out' ,href: signout_path)
			end

		end
	end
end
