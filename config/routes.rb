Rails.application.routes.draw do
  get 'courses/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #You can have the root of your site routed with "root"
  root 'top#index'

  devise_for :users, controllers: { sessions: 'users/sessions' ,  registrations: "users/registrations"}

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    get 'sign_up', to: 'users/registrations#new'
    get "profile", :to => "users/registrations#edit"
  end

  resources :courses, only: [:index] do
    collection do
      get 'recode_word'
    end
  end

  get "courses/:id", to: 'courses#index'
  get "courses/:id/:type", to: 'courses#index'
  get "courses/exam/:id", to: 'courses#exam'
  get "courses/exam/:id/:type", to: 'courses#exam'
  get "courses/clear_course/:id/:type", to: 'courses#clear_course'

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
