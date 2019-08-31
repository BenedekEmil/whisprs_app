Rails.application.routes.draw do

  resources :whisprs do
    resources :comments
    match "vote", action: :vote, via: [:put,:delete], on: :member
    member do
      put 'like', to: "whisprs#like"
      put 'unlike', to: "whisprs#unlike"
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'whisprs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
