Rails.application.routes.draw do
  root "codes#index"
  resources :codes
end
