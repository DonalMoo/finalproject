class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_user, :only => :show
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    redirect_to(signedinuserprofile_path) unless current_user.id.to_s == params[:id] or current_user.admin?
  end

  #method to redirect user to their profile or create a new profile if none exists, taken from Adriana chis class tutorials
  def signedinuserprofile
    profile = Profile.find_by_user_id(current_user.id)
    if profile.nil?
      redirect_to "/profiles/new"
    else
      @profile = Profile.find_by_user_id(current_user.id)
      redirect_to "/profiles/#{@profile.id}"
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    redirect_to(signedinuserprofile_path) unless current_user.id.to_s == params[:id] or current_user.admin?
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :user_id, :has_tin, :has_bod, :has_mand, :has_fiddle)
    end

    # only allow user to see their own profile unless they are an admin and redirect user to tutorials page if they do not have a tutorial 
    def validate_user
      @profile = Profile.find_by_user_id(current_user.id)

      if @profile.has_bod or @profile.has_tin or @profile.has_mand or @profile.has_fiddle
         redirect_to(signedinuserprofile_path) unless current_user.id.to_s == params[:id] or 
         current_user.admin?

      else
        redirect_to(tutorials_path, notice: 'Your profile is empty! Purchase a tutorial or enter a voucher code to add tutorials to your account') 
      end
    end 

end
