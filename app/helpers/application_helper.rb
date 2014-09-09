module ApplicationHelper
	include SessionsHelper

	def full_title(subtitle)
		base_title = 'Ruby on Rails Tutorial Sample App'
		if subtitle.empty?
			base_title
		else
			"#{base_title} | #{subtitle}"
		end
	end
end
