#Rails.application.routes.draw do
#  get "sessions/new"
  
#  root "home#index"

#  get "home/index"
#  get "home/about"
#  get "home/contactus"
#  get "home/help"
  
#  resources :microposts do
#    member do
#      get :like
#    end
#  end

#  resources :users

#  get 'microposts/:id/like' => 'microposts#like', as: :likeAPost
  
#end

#-----------------------------------------------------------------------

Rails.application.routes.draw do
  resources :microposts
  
  root "home#index"
  get '/' => 'home#index', as: :home_page
  get 'home/index' => 'home#index'
  get 'home' => 'home#index'
  get "home/about"
  get "home/contactus"
  get "home/help"

  resources :microposts do
    member do
      get :like
    end
  end
  resources :users

  get 'microposts/:id/like' => 'microposts#like', as: :likeAPost



  resources :users do
    member do
      get :boost
    end
  end

  get "/signup", to: "users#new", as: :signup
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

end