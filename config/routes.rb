Rails.application.routes.draw do

  root 'articles#index'
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup', to:'users#new', via:'get'
  match '/signin', to:'sessions#new', via:'get'
  match '/signout', to:'sessions#destroy', via:'delete'
  match '/category', to:'cgrpages#show', via:'get'
  match '/categories', to:'cgrpages#index', via:'get'

  match '/avactless', to:'cgrpages#avactless', via:'get'
  match '/beautifull', to:'cgrpages#beautifull', via:'get'
  match '/nowgirls', to:'cgrpages#nowgirls', via:'get'
  match '/amateur', to:'cgrpages#amateur', via:'get'
  match '/planned', to:'cgrpages#planned', via:'get'
  match '/fetish', to:'cgrpages#fetish', via:'get'
  match '/peeping', to:'cgrpages#peeping', via:'get'
  match '/scatology', to:'cgrpages#scatology', via:'get'
  match '/jk', to:'cgrpages#jk', via:'get'
  match '/jd', to:'cgrpages#jd', via:'get'
  match '/happenings', to:'cgrpages#happenings', via:'get'
  match '/idol', to:'cgrpages#idol', via:'get' 
  
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
