Rails.application.routes.draw do
  root "weeks#index"
  resources :weeks
  resources :codes
end
