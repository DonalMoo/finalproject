require "#{Rails.root}/app/mailers/user_mailer.rb" 
class UserObserver < ActiveRecord::Observer
	
	def after_create(user)
		UserMailer.welcome_email(user).deliver 
	end
end