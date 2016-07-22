class SessionsController < Devise::SessionsController
	
	#Method taken from Adriana Chis class tutorial
	#after_sign_in_path_for is called by devise
	def after_sign_in_path_for(user)
		"/signedinuserprofile" #providing path for users profile
	end
end
