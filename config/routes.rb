Rails.application.routes.draw do
  resources :codes
  resources :code_mngr
  resources :profiles
  devise_for :users
  get 'home/index'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  root :to => 'home#index'

  resources :tutorials

  resources :campaigns, only: [:index, :create, :show, :redeem_code] do
  put 'redeem_code', on: :member
  end

end
