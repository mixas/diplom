Diplom::Application.routes.draw do

  devise_for :users

  root :to => 'pages#home'
  match '/home' => 'pages#home'
  match '/about' => 'pages#about'
  match '/help' => 'pages#help'
  match '/users/logout' => 'users#logout'
  match '/all_tests/:id/run' => 'all_tests#run', :as => "run_test"
  match '/all_tests/:id/results' => 'all_tests#results', :as => "results"
  match '/all_tests/:id/check_answer' => "all_tests#check_answer", :as => "check_answer"
  match '/configurations' => "configurations#index", :as => "config"

  match '/users/test' => "users#test" #test route

  resources :all_tests do
    resources :questions, :only => [:index]
  end

  resources :users
  resources :answers
  resources :questions
  resources :groups

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
  # match ':controller(/:action(/:id(.:format)))'
end
