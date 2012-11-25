Invoiceapp::Application.routes.draw do

  #resources :payments

  resources :invoice_headers do  
	resources :invoice_lines
	resources :payments
  end
  
  #match 'invoice_lines/:id/edit' => 'invoice_lines#edit'

  resources :matters

  resources :billers

  #resources :cust_contacts

  resources :customers do
	resources :cust_contacts
  end

  resources :invoices

  get "home/index"
  
  match '/customer_invoices/:customer_id' => 'invoice_headers#index', :as => 'customer_invoices'
  match '/invoice_payments/:invoice_header_id' => 'payments#index', :as => 'invoice_payments'
  match '/invoice_payments/:invoice_header_id/new' => 'payments#new', :as => 'new_invoice_payments'
  match '/invoice_payments/:invoice_header_id/:id/edit' => 'payments#edit', :as => 'edit_invoice_payments'
  match '/invoice_payments/:invoice_header_id/:id/destroy' => 'payments#destroy', :as => 'destroy_invoice_payments'

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
