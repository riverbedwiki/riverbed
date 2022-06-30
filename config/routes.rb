Rails.application.routes.draw do

  resources :members
  resource :session

  resources :propositions do
    resources :arguments
  end
  resources :perspectives
  resources :questions do
    resources :answers
  end
end
