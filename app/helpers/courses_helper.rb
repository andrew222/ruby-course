module CoursesHelper
	require 'rdiscount' 
	
	def markdown_to_html(content)
		RDiscount.new(content).to_html
	end
end
