Rails.application.routes.draw do
  resources :facilities
  resources :publishes
  resources :media
  resources :links
  resources :activities
  resources :areas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
