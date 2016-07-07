class HomeController < ApplicationController
  def index
  	@tutorials = Tutorial.all
  end
end
