require 'rails_helper'
include ApplicationHelper

describe "AuthenticationPages" do
  	subject { page }

  	describe "signin page" do
  		before(:each) { visit signin_path }

		it { should have_selector('h1', text: 'Sign in') }
		it { should have_title( full_title('Sign in') ) }

		describe "with invalid info" do
			before { click_button "Sign in" }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }
		end

		describe "with valid info" do
			let(:user){ FactoryGirl.create(:user) }
			before(:each) do
				fill_in "Email",		with: user.email
				fill_in "Password",		with: user.password
				click_button "Sign in"
			end

			 it { should have_title(user.name) }
			 it { should have_link('Profile', href: user_path(user)) }
			 it { should have_link('Sign out', href: signout_path) }
			 it { should_not have_link('Sign in', href: signin_path) }

			 describe "followed by sign out" do
			 	before { click_link "Sign out" }
			 	it { should have_link('Sign in', href: signin_path) }
			 end
			 
		end
	end
end
