Rails.application.routes.draw do
  resources :tuyencaps
  root 'bes#index'
  resources :bes
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
      post 'add_bes'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
