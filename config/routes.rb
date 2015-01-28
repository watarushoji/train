Rails.application.routes.draw do

  get 'huzokus/index'

  get 'huzoku/index'

  root 'articles#index'

  #resources
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]
  resources :crawlsites, only: [:index, :create, :destroy]
  resources :avsamples
  resources :articles, only: [:show] do
    collection do
      resources :categories, only: [:show,:index]
    end
  end
  resources :categories
  resources :huzokus

  match '/articles/categories/:id/popular', to: 'categories#popular', via: 'get'
  
  #crawlsites
  get '/crawlsites/:id/new', to:'crawlsites#new'
  match '/clearall', to:'crawlsites#delete_all_records', via:'delete'

  #misceranious
  match '/delcontacts', to:'delcontacts#index', via:'get'
  match '/popmovies', to:'popmovies#index', via:'get'
  match '/news', to:'news#index', via:'get'
  match '/sitemaps', to:'sitemaps#sitemaps', via:'get'

  #??
  match '/articles/:id/edit', to: 'articles#edit', via: 'put'
  # rss feeds
  resources :feeds, :format => 'rss', only:[:index]
  # match '/feed', to: 'feeds#feed', via: 'get'
 
  # static_pages
  match '/about', to:'static_pages#about', via:'get'
  match '/contact', to:'static_pages#contact', via:'get'
  
  # users
  match '/signup', to:'users#new', via:'get'
  # sessions
  match '/signin', to:'sessions#new', via:'get'
  match '/signout', to:'sessions#destroy', via:'delete'
  # cagegories
  match '/category', to:'cgrpages#show', via:'get'
  match '/categories', to:'cgrpages#index', via:'get'
  # categories_each

  # redirect
  get '/assets/list_popular.gif', to:'static_pages#home'
  match '/avactless', to:'static_pages#home', via:'get'
  match '/beautifull', to:'static_pages#home', via:'get'
  match '/nowgirls', to:'static_pages#home', via:'get'
  match '/amateur', to:'static_pages#home', via:'get'
  match '/planned', to:'static_pages#home', via:'get'
  match '/fetish', to:'static_pages#home', via:'get'
  match '/peeping', to:'static_pages#home', via:'get'
  match '/scatology', to:'static_pages#home', via:'get'
  match '/jk', to:'static_pages#home', via:'get'
  match '/jd', to:'static_pages#home', via:'get'
  match '/happenings', to:'static_pages#home', via:'get'
  match '/idol', to:'static_pages#home', via:'get' 
  get '/articles/1/posts.rss', to:'feeds#index', :format=>"rss"
  match '/articles_categories', to:'categories#articles_categories', via:'get'
  

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
