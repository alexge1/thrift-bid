Rails.application.routes.draw do

  # parameters: fname, lname, email, password
  post 'user/register', to: 'users#new'
  
  # parameters: email, password
  post 'user/login', to: 'users#login'

  #header: uid
  #parameters: all the attributes, sizes, preferences, etc.
  post 'user/update', to: 'users#update'
  
  # header: uid
  get 'items', to: 'items#render_next_items'
  
  # header: uid
  # url-parameter: :id (item)
  get 'item/:id', to: 'items#get_item'
  
  # header: uid
  # parameter: item_id
  post 'view/create', to: 'views#new_view'
  
  # header: uid
  # parameter: item_id
  post 'like/create', to: 'likes#new_like'
  
  # header: uid
  # paramater: item_id
  delete 'like', to: 'likes#delete'

  # header: uid
  # parameter: item_id, new_bid_price
  post 'bid/super', to: 'bids#new_super_bid'
  post 'bid/normal', to: 'bids#new_normal_bid'
  
  # header: uid
  get 'orders/all', to: 'orders#get_all'
  # header: uid
  # url-parameter: :id (item)
  get 'order/one/:id', to: 'orders#get_order'
  
  # header: uid
  get 'addresses/shipping', to: 'addresses#shipping'
  get 'addresses/billing', to: 'addresses#billing'
  
  # header: uid
  # url-parameter: :id (address)
  get 'address/id_ship/:id', to: 'addresses#one_shipping'
  get 'address/id_bill/:id', to: 'addresses#one_billing'
  
  # header: uid
  # parameters: recipient, line1, (line2), city, state, zip_code
  post 'address/ship/create', to: 'addresses#new_shipping'
  post 'address/bill/create', to: 'addresses#new_billing'
  
  # header: uid
  get 'payments', to: 'payments#get_all'
  
  # header: uid
  # url-parameter: :id (payment)
  get 'payment/:id', to: 'payments#get_one'
  
  # header: uid
  # parameters: cardholder, card_number, cvv, provider, month, year
  post 'payment/new', to: 'payments#new_payment'


  # TESTING ONLY
  # no reqirements. all parameters are available
  # post 'item', to: 'items#new_item'



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
