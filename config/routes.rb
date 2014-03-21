Gruben::Application.routes.draw do
  get "places/index"
  get "places/update"
  get "places/delete"
  get "places/create"
  resources :image_artifacts do
    member do
      get "flag"
      get "main"
      get "primary"
      post "update_latlong"
    end

    collection do
      post "adit"
      get "download"
    end
  end

  resources :places do
    collection do
      get "download"
    end
  end
  resources :maps do
    collection do
      post "adit"
    end
    member do      
      get "adit"
      get "image_artifact"
    end
  end

  resources :users, :user_sessions
  resources :maps
  resources :adits
  resources :notes
  resources :image_artifacts
  resources :markers
  resources :places

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
  
  #root :to => 'user_sessions#new'
  root :to => 'maps#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
