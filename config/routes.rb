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

  #code adapted from https://matharvard.ca/posts/2014/jan/11/contact-form-in-rails-4/
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'

  #code adapted from coupon_code git hub repositary
  resources :campaigns, only: [:index, :create, :show, :redeem_code] do
  put 'redeem_code', on: :member
  end

  get '/instrument_care' => 'instrument_care#index'

end
