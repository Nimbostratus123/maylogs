Maylogs::Application.routes.draw do
	
	resources :users
	
	resources :pages do
		collection do
			get 'new'
			post 'new_post'
			get 'edit_post'
			get 'delete_post'
			
		end
		
		member do
			get 'edit'
			get 'home_page'
			get 'display'
			get 'delete'
			post 'update'
		end
	end
	
	resources :sessions, only: [:new, :create, :destroy]
	
	root :to => 'static#home'

  get "static/home"
 
  get "static/search"
 
  get "static/reference"
 
  get "static/about"
	
  # get "pages/new"
	#
  # get "pages/edit"
  # 
  # get "pages/delete"
	# 
  # get "pages/update"
  # 
  # get "pages/create"

	
	match 'reference', to: 'static#reference'
	match 'about', to: 'static#about'
	match 'signup', to: 'users#new'
	match 'log_in', to: 'sessions#new'
	match 'log_out', to: 'sessions#destroy'#, via: :delete

	
	
	match ':username/:id' => 'pages#display'
	match ':username' => 'pages#username_root'
	
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
  # match ':controller(/:action(/:id))(.:format)'
end
