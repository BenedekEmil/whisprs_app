Rails.application.routes.draw do

  post ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user
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
