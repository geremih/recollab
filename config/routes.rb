BaseApp::Application.routes.draw do


  get 'links/create'
  get "pages/query"
  post "pages/result"
  resources :pages

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"

  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end
  resources :users, only: [:show, :index]
  resources :follower_tag_relationships, only: [:create, :destroy]
  root :to => "users#index"

end
