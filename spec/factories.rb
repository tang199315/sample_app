FactoryGirl.define do 
	factory :user do
		name 		'testing'
		email 		'testing@example.com'
		password	'foobar'
		password_confirmation	'foobar'
	end
end