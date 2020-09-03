Rails.application.routes.draw do
  root to: 'cocktails#home'
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:create]
    resources :reviews, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]
end
