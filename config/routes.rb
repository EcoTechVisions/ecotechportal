Rails.application.routes.draw do
  
  authenticated do
    root 'user#account', as: :authenticated
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users
  resources :users do
    resources :companies
    resources :timesheets
    resources :tickets
  end

  resources :courses do
    resources :weeks do
      resources :topics
    end
  end
  
  resources :posts
  
  resources :comments
  resources :jobs
  resources :events
  resources :groups
  
  resources :questionnaires do
    resources :questions do
      resources :answers
    end
  end

  get 'allumni' => "site#allumni"
  get 'ecoguide' => "site#ecoguide"
  get 'resources' => "site#resources"
  get 'dashboard' => "site#dashboard"
  get 'slideshow' => "site#slideshow"
  get 'workshops' => "events#workshops"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  # HAS TO BE LAST ROUTE
  match '*unmatched_route', to: 'site#not_found', via: :all
end
