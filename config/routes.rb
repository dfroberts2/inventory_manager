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
  resources :owners, only: [:index] do
    resources :businesses, only: [:index, :show]
  end

  resources :inventories, only: [:show, :new, :create] do
    resources :category_scanners, only: [:create]
    resources :categories, only: [:edit, :update]
  end

  get 'inventories/:id/edit_margins' => 'inventories#edit_margins', as: :edit_margins
  put 'inventories/:id' => 'inventories#update_margins', as: :update_margins
  get 'inventories/:id/trans_report' => 'inventories#trans_report', as: :trans_report
  get 'inventories/:id/dept_report' => 'inventories#dept_report', as: :dept_report

  resources :category_scanners, only: [:edit, :update, :destroy] do
    collection {post :import}
    post 'category_items' => 'category_items#create'
  end

  get 'owners/:id/businesses/:id/inventories/:year' => 'inventories#index_by_year'
end
