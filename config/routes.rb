Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, except: %i[new]
  resources :users, only: %i[show create]
  resources :login, only: %i[create]
end
