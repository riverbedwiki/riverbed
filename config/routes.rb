Rails.application.routes.draw do

  resources :members
  resource :session

  resources :theories
end
