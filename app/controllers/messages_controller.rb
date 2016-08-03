class MessagesController < ApplicationController
#modified code from https://matharvard.ca/posts/2014/jan/11/contact-form-in-rails-4/[Accessed,26th June 2016]
#@author Mat Harvard 	
	  def new
    	@message = Message.new
    end

  	def create
    	@message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to home_index_path, notice: "Your message has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  	def message_params
    	params.require(:message).permit(:name, :email, :content)
  	end
end
