class MessagesController < ApplicationController
  def index
   @messages = current_user.messages.all
  end
  def new
    @message= Message.new
  end
  
  def create
    @message = Message.new(params.require(:message).permit(:sender,:senderid,:subject,:user_id,:body))
    @message.sender = current_user.firstname
  
    if @message.save
      redirect_to user_path(@message.user) 
    else
      redirect_to listings_path 
    end
  
  end
  def destroy
        Message.find(params[:param1]).destroy
        redirect_to messages_path 
  end

end
