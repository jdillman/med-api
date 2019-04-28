Rails.application.routes.draw do
  resources :visit_items
  resources :visits
  resources :accounts
  resources :person_types
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
