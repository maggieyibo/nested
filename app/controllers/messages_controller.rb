class MessagesController < ApplicationController
def index
 @messages = current_user.messages.all
end
def new
  @message= Message.new
end

def create
  @message = Message.new(params.require(:message).permit(:sender,:subject,:user_id))
  @message.sender = current_user.firstname

  if @message.save
    redirect_to user_path(@message.user) 
  else
    redirect_to listings_path 
  end

end
end
