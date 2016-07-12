Rails.application.routes.draw do
  resources :codes
  resources :code_mngr
  resources :profiles
  resources :tutorials
  devise_for :users
  get 'home/index'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  root :to => 'home#index'

  #code adapted from https://matharvard.ca/posts/2014/jan/11/contact-form-in-rails-4/
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'

  resources :campaigns, only: [:index, :create, :show, :redeem_code] do
  put 'redeem_code', on: :member
  end

end
