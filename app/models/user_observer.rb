require "#{Rails.root}/app/mailers/user_mailer.rb" 
class UserObserver < ActiveRecord::Observer
	
	#use rails observer to send mail after a user creates an account
	def after_create(user)
		UserMailer.welcome_email(user).deliver 
	end
end