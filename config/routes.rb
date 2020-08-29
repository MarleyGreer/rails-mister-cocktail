Rails.application.routes.draw do

  resources :cocktails, only: [:index, :show, :new, :create] do
  resources :doses, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  resources :doses, only: [:destroy]
end
