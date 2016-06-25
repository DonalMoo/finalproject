class CodeMngrController < ApplicationController
	before_filter :authenticate_user!
  	before_filter :ensure_admin, :only => [:show, :edit, :destroy]

 def index
	render locals: { codes: codes, campaign: Campaign.new }
 end

 def ensure_admin
    if user_signed_in? && current_user.admin?
      return true
    else
      flash[:notice] = "Action not allowed"
      redirect_to root_path
      return false
    end
 end

  private

  	def codes
    	1.upto(1000).map { CouponCode.generate }.uniq
  	end
end
