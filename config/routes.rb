Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    root to: 'questions#index'

    get "logout" => "sessions#logout_user", :as => "logout"
    get "login" => "sessions#new", :as => "login"
    get "signup" => "users#new", :as => "signup"
    resources :users, :only => [:new, :create]
    resources :sessions, :only => [:new, :create, :destroy] do
    end

    resources :questions, :except => [:show, :update, :destroy] do
      resources :answers, :only => [:create, :update, :destroy]
    end
    get 'questions/:id/(:title)' => 'questions#show', :as => 'question'
    put 'questions/:id' => 'questions#update'
    patch 'questions/:id' => 'questions#update'
    delete 'questions/:id' => 'questions#destroy'
  end
end

