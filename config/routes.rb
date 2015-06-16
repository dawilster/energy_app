Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get '/lab_survey', :to => redirect('/labsurvey/index.html')

  resources :dashboard
  # resources :lab_surveys, only: [:show, :create, :new]

  namespace :api do
    namespace :v1 do
      resources :feedbacks, only: [:index, :create, :show]
      resources :events, only: [:index, :create, :show]
      resources :surveys, only: [:index, :create, :show]
      resources :open_surveys, only: [:create, :show]
    end
  end
end
