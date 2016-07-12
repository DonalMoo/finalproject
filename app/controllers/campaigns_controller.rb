class CampaignsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin, :only => [:show, :edit, :destroy]
  before_action :set_campaign, only: [:show, :redeem_code]

  # GET /campaigns/1
  # GET /campaigns/1.json
  def index
    @campaigns = Campaign.all
  end

  def show
    render locals: { campaign: @campaign}
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # modified code from coupon code git documentation - https://github.com/baxang/coupon-code
  def redeem_code
    @profile = Profile.find_by_user_id(current_user.id)
    #@tutorial = Tutorial.find_by_id(params[:id])
    msg = []
    user_code = params[:code]
    code = @campaign.codes.find_by(code: user_code)
    @tutorial_id = params[campaign: :tutorial_id]

    puts @tutorial_id.inspect

    unless code
      msg << 'Code not found.'
    else
      if code.redeemed?
        msg << 'Code already redeemed.'
      end

      unless code.redeem
        msg << 'Code redeem failed.'
      end
    end

    if msg.empty? && @tutorial_id == '1'
      msg << 'Code was successfully redeemed. You now have access to this tutorial' 
      @profile.update(:has_bod => true ) 

      redirect_to signedinuserprofile_path, notice: msg.join(' ')
    else
      redirect_to tutorials_path, notice: msg.join(' ')
    end
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

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title)
  end
end