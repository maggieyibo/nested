class UsersController < ApplicationController
	# before_action :authorize
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		#creates a user, after user signs up, redirects to login page.
		@user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
		
		if @user.save
			redirect_to login_path
		else
			render :new
		end
	end

end