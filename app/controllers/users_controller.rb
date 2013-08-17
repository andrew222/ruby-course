class UsersController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  def new
  	@user = User.new()
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to courses_url, :notice => 'log in successed'
  	else
  		render :new
  	end
  end

  def welcome
    
  end
end
