require 'rails_helper'
include ApplicationHelper

describe "User Pages" do
	subject { page }

	describe "Sign Up Page" do
		before(:each){ visit signup_path}

		it { has_css?('h1', text: 'Sign up') }
		it { has_css?('title', text: full_title('Sign up')) }
	end

	describe "Profile page" do
		let(:user){ FactoryGirl.create(:user) }
		before { visit user_path(user) }
		
		it { has_css?('title', text: user.name) }
		it { has_css?('h1', text: user.name) }


	end
end
