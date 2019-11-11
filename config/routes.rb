# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :comments, only: [:create, :update, :destroy]
    resources :comment_types

    resources :orders do
      member do
        get :comments
      end
    end
  end
end
