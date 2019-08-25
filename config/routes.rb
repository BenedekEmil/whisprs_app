Rails.application.routes.draw do
  resources :whisprs

  devise_for :users, controller: { registrations: 'registrations' }

  root 'whisprs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
