class SessionsController < ApplicationController
  	skip_before_action :ensure_logged_in

  	def new
  	end

  	def create
    	user = User.find_by(username: params[:username])
    	if user && user.authenticate(params[:password])
    		session[:user_id] = user.id
      		redirect_to root_path
    	end
	end
end