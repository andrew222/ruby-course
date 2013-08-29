module UsersHelper
	def display_error_msg(user)
		errors = user.errors
		if errors[:email].length > 0
			message = "Email: '#{user.email}' " + errors[:email].first
		elsif errors[:name].length > 0
			message = "Name: " + errors[:name].first
		elsif errors[:password].length > 0
			message = "Password: " + errors[:password].first
		end
		message
	end
end
