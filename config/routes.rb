Rails.application.routes.draw do
  # Routes for the Favorite resource:
  # CREATE
  root 'services#index'


  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"
  get "/my_favorites", :controller => "favorites", :action => "my_favorites"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  # Routes for the Rating resource:
  # CREATE
  get "/ratings/new", :controller => "ratings", :action => "new"
  post "/create_rating", :controller => "ratings", :action => "create"

  # READ
  get "/ratings", :controller => "ratings", :action => "index"
  get "/ratings/:id", :controller => "ratings", :action => "show"

  # UPDATE
  get "/ratings/:id/edit", :controller => "ratings", :action => "edit"
  post "/update_rating/:id", :controller => "ratings", :action => "update"

  # DELETE
  get "/delete_rating/:id", :controller => "ratings", :action => "destroy"
  #------------------------------

  # Routes for the Service resource:
  # CREATE
  get "/services/new", :controller => "services", :action => "new"
  post "/create_service", :controller => "services", :action => "create"
  get "/service/veterinary", :controller => "services", :action => "veterinary"
  get "/service/groom", :controller => "services", :action => "groom"
  get "/service/stores", :controller => "services", :action => "stores"
  get "/service/sitter", :controller => "services", :action => "sitter"
  get "/service/shelter", :controller => "services", :action => "shelter"
  get "/service/hotels", :controller => "services", :action => "hotels"
  get "/service/trainers", :controller => "services", :action => "trainers"

  # UPDATE
  get "/services/:id/edit", :controller => "services", :action => "edit"
  post "/update_service/:id", :controller => "services", :action => "update"

  # READ
  get "/services", :controller => "services", :action => "index"
  get "/services/:id", :controller => "services", :action => "show"



  # DELETE
  get "/delete_service/:id", :controller => "services", :action => "destroy"
  #------------------------------

  devise_for :users

  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
