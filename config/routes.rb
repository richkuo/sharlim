Sharlim::Application.routes.draw do

  get "comments/new"

  get "comments/create"

  get "comments/edit"

  get "comments/update"

  get "comments/destroy"

  devise_for :speakers
  devise_for :users

  root to: 'static_pages#home'

  match '/about',         to: "static_pages#about"
  match '/help',          to: "static_pages#help"
  match '/contact',       to: "static_pages#contact"
  match '/terms',         to: "static_pages#terms"
  match '/privacy',       to: "static_pages#privacy"
  match '/signin',        to: "sessions#signin"
  match '/past_events',   to: "events#past_events"
  match '/admin',         to: "static_pages#admin"

  match '/bryan_thomas', to: "static_pages#bryan_thomas"

  match '/david_otunga', to: "static_pages#david_otunga"

  resources :users do
    resources :events do
      # resources :comments
    end
  end

  resources :events do#, only: [:index, :show, :new, :create, :edit] do #this needs to be restricted to admins
    resources :charges, only: [:new, :create]
    # resources :comments
  end

  resources :guestlists, only: [:create, :destroy]

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
