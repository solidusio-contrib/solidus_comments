Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :comments
    resources :comment_types

    resources :orders do
      member do
        get :comments
      end
    end
  end
end
