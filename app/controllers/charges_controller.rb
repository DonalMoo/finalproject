class ChargesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@tutorials = Tutorial.all
	end

	def new	
	end

#modified code from stripe api documentation
	def create

		#created empty message string
		msg = []
		@profile = Profile.find_by_user_id(current_user.id)
		@tutorial_id = params[:tutorial_id]
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

			if @tutorial_id == '1' 
      		@profile.update(:has_bod => true ) 

      		msg << 'Thank you for your payment! You now have access to the Bodhran tutorial'

      		redirect_to signedinuserprofile_path, notice: msg.join(' ')
    		elsif @tutorial_id == '2'
      	 
      		@profile.update(:has_tin => true ) 

      		msg << 'Thank you for your payment. You now have access to the Tin Whistle tutorial'

      		redirect_to signedinuserprofile_path, notice: msg.join(' ')
		    else
		      redirect_to tutorials_path, notice: msg.join(' ')
		    end
		 

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
		end

end
