Rails.application.routes.draw do
  namespace :admin do
    resources :projects, only: [:create, :update, :destroy]
  end

  devise_for :users, defaults: { format: :json }

  resources :projects, only: [:index, :show] do
    resources :tickets
  end
end
