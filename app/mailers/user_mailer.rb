class UserMailer < ApplicationMailer
default from: "Waltons Online Tutorials <noreply@waltonsonline.com>"

	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to Waltons Online Tutorials!')
	end

	def new_tutorial_email(user, profile, user_code, tutorial)
		@user = user
		@profile = profile
		@user_code = user_code
		@tutorial = tutorial
		mail(to: @user.email, subject: 'Congratulations you added a tutorial to your acount')
	end

	def new_stripe_order(user, profile, tutorial)
		@user = user
		@profile = profile
		@tutorial = tutorial
		mail(to: @user.email, subject: 'Thank you for your purchase')
	end
end