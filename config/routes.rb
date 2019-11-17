Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'sessions/new'
      get 'sessions/create'
      get 'sessions/destroy'

      resources :users
      resources :accounts
      resources :visit_items
      resources :visits
      resources :person_types
      resources :people
    end
  end
end
