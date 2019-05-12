Rails.application.routes.draw do
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
