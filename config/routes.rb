Rails.application.routes.draw do
  resources :codes
  resources :code_mngr
  resources :profiles
  
  
  resources :tutorials do |tutorials|
    resources :charges
  end

  devise_for :users
  get 'home/index'

  #code adapted from Adriana Chis cloud application development tutorial class
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  root :to => 'home#index'

  #modified code from https://matharvard.ca/posts/2014/jan/11/contact-form-in-rails-4/[Accessed,26th June 2016]
  #@author Mat Harvard 
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'

  #Adapted from coupon code gem documentation - https://github.com/baxang/coupon-gen
  #@author Sanghyun Park [Accessed 25 June 2016]
  resources :campaigns, only: [:index, :create, :show, :redeem_code] do
  put 'redeem_code', on: :member
  end

  get '/instrument_care' => 'instrument_care#index'

end
