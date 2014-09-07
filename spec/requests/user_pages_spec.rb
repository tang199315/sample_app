require 'rails_helper'
include ApplicationHelper

describe "User Pages" do
	subject { page }

	describe "Sign Up Page" do
		before(:each){ visit signup_path}
		it { should have_selector('h1', :text => 'Sign up') }
		it { should have_selector('title', :text => full_title('Sign up'))  }
	end

	describe "Profile page" do
		before(:each){ @user = FactoryGirl.create(:user) }
		before { visit user_path(@user) }

		it { should have_selector('h1', text: @user.name) }
		it { should have_selector('title', text: @user.name)}
	end
end
