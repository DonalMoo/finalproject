require 'my_logger'
class ChargesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@tutorials = Tutorial.all
	end

	def new	
	end

	#modified code from stripe api documentation
	def create
		#created empty array to store messages
		msg = []
		@profile = Profile.find_by_user_id(current_user.id)
		@tutorial_id = params[:tutorial_id]
		@user = User.find_by_id(current_user.id)
    	@tutorial = Tutorial.find_by_id(@tutorial_id)

    	#retreive the object MyLogger class
    	logger = MyLogger.instance

		  # Amount in cents
		  @amount = 500

		  customer = Stripe::Customer.create(
		    :email => current_user.email,
		    :source  => params[:stripeToken]
		  )


		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'eur'
		  )
		  	#update users profile to allow access to the tutorial with id shown
			if @tutorial_id == '1' 
      		@profile.update(:has_bod => true ) 
      		msg << 'Thank you for your payment! You now have access to the Bodhran tutorial'
      		#append details to userlog.txt
      		logger.logInformation("User: " + @profile.firstname + @profile.lastname + " Has added: " + @tutorial.title + " to their profile via stripe payment")
      		#pass objects user, profile, and tutorial to usermailer to add to mail and deliver mail now
      		UserMailer.new_stripe_order(@user, @profile, @tutorial).deliver_now
      		redirect_to signedinuserprofile_path, notice: msg.join(' ')

      		#update users profile to allow access to the tutorial with id shown
    		elsif @tutorial_id == '2'
      		@profile.update(:has_tin => true ) 
      		msg << 'Thank you for your payment. You now have access to the Tin Whistle tutorial'
      		#append details to userlog.txt
      		logger.logInformation("User: " + @profile.firstname + @profile.lastname + " Has added: " + @tutorial.title + " to their profile via stripe payment")
      		#pass objects user, profile, and tutorial to usermailer to add to mail and deliver mail now
      		UserMailer.new_stripe_order(@user, @profile, @tutorial).deliver_now
      		redirect_to signedinuserprofile_path, notice: msg.join(' ')

      		#update users profile to allow access to the tutorial with id shown
      		elsif msg.empty? && @tutorial_id == '3'	     
		    msg << 'Thank you for your payment! You now have access to the Mandolin tutorial' 
		    @profile.update(:has_mand => true )
		    #append details to userlog.txt
      		logger.logInformation("User: " + @profile.firstname + @profile.lastname + " Has added: " + @tutorial.title + " to their profile via stripe payment") 
      		#pass objects user, profile, and tutorial to usermailer to add to mail and deliver mail now
		    UserMailer.new_stripe_order(@user, @profile, @tutorial).deliver_now
		    redirect_to signedinuserprofile_path, notice: msg.join(' ')

		    #update users profile to allow access to the tutorial with id shown
		    elsif msg.empty? && @tutorial_id == '4'
		    msg << 'Thank you for your payment. You now have access to the Irish Fiddle tutorial' 
		    @profile.update(:has_fiddle => true ) 
		    #append details to userlog.txt
      		logger.logInformation("User: " + @profile.firstname + @profile.lastname + " Has added: " + @tutorial.title + " to their profile via stripe payment")
      		#pass objects user, profile, and tutorial to usermailer to add to mail and deliver mail now
		    UserMailer.new_stripe_order(@user, @profile, @tutorial).deliver_now
		    redirect_to signedinuserprofile_path, notice: msg.join(' ')
		    
		    else
		      redirect_to tutorials_path, notice: msg.join(' ')
		    end	 

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
		end

end
