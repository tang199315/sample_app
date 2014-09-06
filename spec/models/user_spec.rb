# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

require 'spec_helper'

describe User do
	before(:each){ @user = User.new(name: 'user', email: 'user@example.com',
							password: 'foobar', password_confirmation: 'foobar') }
	subject{ @user }

	it { should respond_to(:name) }
	it { should respond_to(:email)}
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate)}
	#it { should be_valid}

#name
	describe "when name is no present" do
		before { @user.name = ' ' }
		it { should_not be_valid}
	end

	describe "when name is too long" do
		before { @user.name = "a"*51 }
		it { should_not be_valid }
	end
#email
	describe "when email is no present" do
		before { @user.email = ' ' }
		it { should_not be_valid }
	end

	describe "when email is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
						foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |address|
				@user.email = address
				@user.should_not be_valid
			end
		end
	end

	describe "when email is valid" do
		it "should be invalid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |address|
				@user.email = address
				@user.should be_valid
			end
		end
	end

	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
		it "should save as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			@user.reload.email.should == mixed_case_email.downcase
		end
	end

	describe "when email address is already token" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email.upcase!
			user_with_same_email.save
		end
		it {should_not be_valid}
	end
#possword
	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password doesn't match password confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password_confirmation is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = 'a'*5}
		it { should_not be_valid }
	end
#authenticate
	describe "return value of authenticate method" do
		before { @user.save }
		puts @user
		let(:found_user) { User.find_by_email(@user.email) }
 
		describe "with valid password" do
			it {  @user.should == found_user.authenticate(@user.password) } 
		end

		describe "with invalid password" do
			let(:user_with_invalid_password) { found_user.authenticate("invalid") }

			it { should_not == user_with_invalid_password}
			specify { user_with_invalid_password.should be_false }
		end
	end

end
