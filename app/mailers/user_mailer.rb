class UserMailer < ApplicationMailer
default from: "Waltons Online Tutorials <noreply@waltonsonline.com>"


	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to Waltons Online Tutorials!')
	end
end