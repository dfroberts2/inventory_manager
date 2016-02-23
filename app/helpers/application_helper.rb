module ApplicationHelper
	def convert_to_dollar(cents_value)
    	(cents_value / 100).round(2)
  	end
end
