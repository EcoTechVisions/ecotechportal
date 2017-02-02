Rails.application.routes.draw do
  authenticated do
    root 'users#index', as: :authenticated
  end
  root 'site#index'

  devise_for :users
  resources :users
  resources :weeks
  resources :topics
  resources :timesheets
  resources :profiles
  resources :lessons
  resources :groups
  resources :courses
  resources :companies
  resources :cohorts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  

  # HAS TO BE LAST ROUTE
  match '*unmatched_route', to: 'site#not_found', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
