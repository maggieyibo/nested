class SessionsController < ApplicationController
	def new
	end

	def create
		#user authentication required/added flash messages.
		user = User.find_by(username: params[:user][:username])
		if user && user.authenticate(params[:user][:password])

			flash[:success] = "Login Successful"
			session[:user_id] = user.id
			redirect_to listings_path
		else
			flash.now[:danger] = "Unable to Login, Please try again!"
			render :new
		end
	end

	def destroy
		#redirects to login page after user logs off
		session[:user_id]= nil
		redirect_to login_path
	end


end
