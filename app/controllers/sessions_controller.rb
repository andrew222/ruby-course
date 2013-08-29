class SessionsController < ApplicationController
  skip_before_filter :require_user

	def new
		@user_session = User.new
	end

	def create
		user = User.authenticate(params["/sessions"][:email], params["/sessions"][:password])
		if user
			session[:user_id] = user.id
			redirect_to welcome_url
		else
			flash.alert = 'Invalid email or password'
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => 'Log out'
	end
end