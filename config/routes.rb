Geo::Application.routes.draw do

  get "service_categories" => "static_pages#categories", :as => "service_categories"
  get "find_location" => "static_pages#home", :as => "find_location"
  get "services" => "services#index", :as => "services"

  get "service/:category" => "services#index", :as => "services_category"

  #match 'servies/:id' => 'catalog#view'

  get "log_in" => "sessions#new", :as => "log_in"
  get "login" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "logout" => "sessions#destroy", :as => "logout"


  post 'set_location' => "sessions#set_location", :as => 'set_location'
  post 'find_me' => "sessions#find_me", :as => 'find_me'
  post 'forget_me' => "sessions#forget_me", :as => 'forget_me'
  #post 'search_for_location' => "services#search_for_location", :as => 'search_for_location'
  post 'search_for_location' => "locations#index", :as => 'search_for_location'


  get "sign_up" => "users#new", :as => "sign_up"

  resources :users
  resources :sessions

  resources :merchants do
    resources :services, :shallow => true
  end

  get "locations/index"

  resources :tasks, :locations

  root :to => 'locations#index'

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
