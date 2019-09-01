Rails.application.routes.draw do

  resources :whisprs do
    get :profile, :to => "whisprs#profile"
    resources :comments do
      put 'like', to: "comments#like"
      put 'unlike', to: "comments#unlike"
      match "vote", action: :vote, via: [:put,:delete], on: :member
    end
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
