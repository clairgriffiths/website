Rails.application.routes.draw do


  devise_for :users, only: :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'posts#index'

  #high_voltage
  root to: 'pages#welcome', id: 'welcome'
  get "/pages/portfolio" => 'pages#portfolio'
  get "/pages/about" => 'pages#about'
  get "/pages/menu" => 'pages#menu'
  get "/pages/musicals" => 'pages#musicals'
  get "/pages/website" => 'pages#website'
  get "/pages/skills" => 'pages#skills'
  get "/pages/inventory" => 'pages#inventory'
	devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'snippetcategory' => "snippets#snippetcategory"
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"
  get "sitemap.xml" => "sitemap#index", as: "sitemap", defaults: { format: "xml" }
  get "/time_entries/dashboard" => 'time_entries#dashboard'
  post "/time_entries/dashboard" => 'time_entries#dashboard'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :posts
	resources :snippets 
	resources :tags
  resources :entries 
  resources :projects
	resources :topics
  resources :time_entries

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
