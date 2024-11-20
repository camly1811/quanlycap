Rails.application.routes.draw do
  devise_for :users
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
