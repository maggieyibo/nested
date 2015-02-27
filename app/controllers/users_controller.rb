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
			render :new
		end
	end

	def edit
      @user = User.find(params[:id])
  	end
  	# need to fix this.
  	# def update
   #    #saves update listing
   #    @user = User.find(params[:id])
  
   #  	if @user.update(current_user)
   #   	 redirect_to user_show_path(current_user)
   #  	else
   #    	render :edit
   #  	end
  	# end

end
