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
		@user = User.new(params.require(:user).permit(:username, :firstname, :lastname, :occupation, :phonenumber, :email, :age, :personality, :bio, :password, :password_confirmation))
		
		if @user.save
                        session[:user_id] = @user.id
			redirect_to listings_path 
		else 
			redirect_to new_user_path
		end
	end

	def edit
      @user = User.find(params[:id])
  	end
  	 def update
          @user = User.find(params[:id])
  
     	if @user.update(params.require(:user).permit(:username, :firstname, :lastname, :occupation, :phonenumber, :email, :age, :personality, :bio, :password, :password_confirmation))
      	 redirect_to user_path(current_user)
     	else
       	render :edit
     	end
  	 end
         def messages
          @messages = current_user.messages.all
         end

end
