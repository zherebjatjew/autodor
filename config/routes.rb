# encoding : UTF-8

Autodor::Application.routes.draw do

  resources :orders
  resources :users
  resources :clients
  resources :cargos
  resources :drivers

  match '/trailers/new' => 'cars#new_trailer', :as => :new_trailer
  match '/trucks/new' => 'cars#new_truck', :as => :new_truck
  match '/users/:user/orders/new' => 'orders#new', :as => :new_order
  match '/trucks' => 'cars#trucks', :as => :cars
  resources :sessions do
    member do
      get 'new'
      post 'create'
      delete 'destroy'
    end
  end
  match '/cargo_fields/:id' => 'orders#cargo_fields', :as => 'cargo_fields'

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  match '/signup', :to => 'users#new'
  match '/users/:id', :to => 'users#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#show'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
