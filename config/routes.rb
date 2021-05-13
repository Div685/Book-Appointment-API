Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :appointments, except: %i[new]
      resources :items, except: %i[new]
      resources :users, only: %i[show create]
      resources :login, only: %i[create]
    end
  end
end
