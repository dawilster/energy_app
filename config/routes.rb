Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  namespace :api do
    resources :feedbacks, only: [:index, :create, :show]
    resources :events, only: [:index, :create, :show]
    resources :surveys, only: [:index, :create, :show]
  end
end
