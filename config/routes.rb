BaseApp::Application.routes.draw do
  get 'tags/show'

  get 'links/create'
  get "pages/query"
  get "pages/result"
  resources :pages
  resources :tags, only: [:show]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"

  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end
  resources :users, only: [:show, :index]
  resources :follower_tag_relationships, only: [:create, :destroy]
  root :to => "pages#index"

end
