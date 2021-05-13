Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: %i[show create]
      resources :login, only: %i[create]
      resources :items, except: %i[new]
      resources :appointments, except: %i[new]
    end
  end
end
