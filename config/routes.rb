Rails.application.routes.draw do

  resources :members
  resource :session

  resources :theories do
    resources :objections
  end
  resources :questions
end
