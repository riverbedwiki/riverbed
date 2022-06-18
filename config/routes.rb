Rails.application.routes.draw do

  resources :members
  resource :session

  resources :propositions
  resources :perspectives
end
