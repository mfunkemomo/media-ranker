Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homepages#index"

  resources :works
  resources :users

  #removed :users from parent for now 
  resources :works do 
    member do 
      post 'upvote'
    end 
    # resources :votes, shallow: true
  end

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
end
