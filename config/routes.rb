Rails.application.routes.draw do
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

  root 'owners#index'
  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'
  resources :owners, only: [:index, :create] do
    resources :businesses, only: [:index, :show, :create]
  end

  resources :inventories, only: [:show] do
    resources :category_scanners, only: [:create]
    resources :categories, only: [:edit, :update]
    resources :upc_scanners, only: [:create]
  end

  get 'inventories/:id/edit_margins' => 'inventories#edit_margins', as: :edit_margins
  put 'inventories/:id' => 'inventories#update_margins', as: :update_margins
  put 'inventories/:id/previous' => 'inventories#update_margins_previous', as: :update_margins_previous
  get 'inventories/:id/cat_trans_report' => 'inventories#cat_trans_report', as: :cat_trans_report
  get 'inventories/:id/upc_trans_report' => 'inventories#upc_trans_report', as: :upc_trans_report
  get 'inventories/:id/dept_report' => 'inventories#dept_report', as: :dept_report

  resources :category_scanners, only: [:edit, :update, :destroy] do
    collection {post :import}
    post 'category_items' => 'category_items#create'
  end
  get 'category_scanners/:id/load_edit_items' => 'category_scanners#load_edit_items', as: :load_cat_edit_items

  resources :upc_scanners, only: [:edit, :update, :destroy] do
    collection {post :import}
    post 'upc_items' => 'upc_items#create'
  end
  get 'upc_scanners/:id/load_edit_items' => 'upc_scanners#load_edit_items', as: :load_upc_edit_items
  
  get 'owners/:id/businesses/:id/inventories/:year' => 'inventories#index_by_year'
  post 'businesses/:id/inventories' => 'inventories#create', as: :business_inventories
end
