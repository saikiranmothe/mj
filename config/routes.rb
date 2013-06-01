Mj::Application.routes.draw do
  devise_for :advertisers

root :to => "advertisements#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :user1s
  ActiveAdmin.routes(self)

  get "about/aboutus"

  match 'aboutus' => 'about#aboutus'


  resources :advertisements


  resources :feedbacks


  resources :events


  resources :relations


  resources :family_members


  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#sign_up", :as => "signup"
  get "search" => "users#search", :as => "search"
  get "rajasthan" => "sessions#about_rajasthan", :as => "rajasthan"
  get "demo_family" => "users#demo_family", :as => "demo_family"
  get "change_password" => "sessions#forgot", :as => "change_password"
  get "publish_event" => "events#new", :as => "publish_event"
  get "give_feedback" => "feedbacks#new", :as => "give_feedback"
  #root :to => "users#home"
 
 
  resources :users
  resources :sessions
  match ':controller(/:action(/:id))(.:format)'
end
