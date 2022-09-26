Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tickets
  end
end
