Rails.application.routes.draw do
	root to: 'questions#index'
	get "logout" => "sessions#logout_user", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"
	resources :users, :only => [:new, :create]
	resources :sessions, :only=> [:new, :create, :destroy] do
	end
  resources :questions do
  	get :index, :path=> ''
  end
  

end

