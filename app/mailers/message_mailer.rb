class MessageMailer < ApplicationMailer

	default from: "Waltons Online Tutorials <noreply@yourdomain.com>"
  	default to: "Your Name <donalmooney87@gmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
end
