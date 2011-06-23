TictactienRails::Application.routes.draw do

  match 'game' => "game#index"

  resources :users

#  resources :user_sessions, :only => [:new, :create, :destroy]
  resource :user_session
  
  root :to => "home#index"

end
