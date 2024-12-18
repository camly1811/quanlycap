Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index destroy new create] do
      get 'change_password', to: 'users#change_password', as: :change_password
      patch 'update_password', to: 'users#update_password'
    end
    get 'user/current', to: 'users#show_current'
    resources :bes, only: [:index, :edit, :update]do
      collection do
        get 'filter_by_loaibe'
        get 'chart'
      end
    end
    resources :tuyencaps, only: [:index]
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :roles do
    delete :bulk_delete, on: :collection
  end
  resources :tuyencaps
  root 'bes#index'
  resources :bes do
    member do
      delete :destroy
    end
  end
  resources :duongongs do
    collection do
      get 'routes'
    end
    member do
      delete 'destroy_route'
    end
  end
  resources :tuyencaps do
    collection do
      post 'create_from_map'
    end
    member do
      post 'add_connections'
      post 'remove_connections'
    end
  end
  resources :users, only: [:show] do
    get 'change_password', to: 'users#change_password', as: :change_password
    patch 'update_password', to: 'users#update_password'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
