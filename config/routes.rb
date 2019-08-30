Rails.application.routes.draw do

  resources :whisprs do
    resources :comments
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'whisprs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
