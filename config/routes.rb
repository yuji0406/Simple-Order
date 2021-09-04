Rails.application.routes.draw do

  scope module: :shops do
  devise_for :shops, controllers:{
    registrations: 'shops/registrations',
    sessions: 'shops/sessions'
  }
  end

  scope module: :customers do
  devise_for :customers, controllers:{
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
  end

  namespace :shops do
    resources :orders, only:[:show,:index,:update]
    resources :customers, only:[:index,:show]
    resource :mypages, only:[:show,:edit,:update]
    resources :items, except:[:destroy]
    resources :reviews, only:[:show]
    get 'homes' => 'homes#top'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'shops/search' => 'shops#search'
    resources :shops, only:[:index,:show]
    resources :rooms, only:[:index,:show,:create]
    resources :messages, only:[:create]
    resources :reviews, only:[:create,:destroy]
    resources :favorites, only:[:index,:create,:destroy]
    get 'orders/complete'
    resources :orders, only:[:new,:create,:index,:show]
    resources :cart_items, only:[:index,:update,:destroy,:create]
      delete 'cart_items/empty'
    resource :mypages, only:[:show,:edit,:update]
    get 'items/search' => 'items#search'
    resources :items, only:[:show,:index]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
