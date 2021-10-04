# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :shops do
    devise_for :shops, controllers: {
      registrations: 'shops/registrations',
      sessions: 'shops/sessions'
    }
  end

  scope module: :customers do
    devise_for :customers, controllers: {
      registrations: 'customers/registrations',
      sessions: 'customers/sessions'
    }
  end

  namespace :shops do
    get 'orders/search' => 'orders#search'
    resources :orders, only: %i[show index update]
    resources :customers, only: %i[index show]
    resource :mypages, only: %i[show edit update]
    get 'items/search' => 'items#search'
    resources :items, except: [:destroy]
    resources :reviews, only: [:show]
    get 'homes' => 'homes#top'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'shops/search' => 'shops#search'
    resources :shops, only: %i[index show]
    resources :rooms, only: %i[index show create] do
      resources :messages, only: [:create]
    end
    resources :reviews, only: %i[create destroy show]
    resources :favorites, only: %i[index create destroy]
    get 'orders/complete'
    resources :orders, only: %i[new create index show]
    delete 'cart_items/empty'
    resources :cart_items, only: %i[index update destroy create]
    resource :mypages, only: %i[show edit update]
    get 'items/search' => 'items#search'
    resources :items, only: %i[show index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
