Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"

  get 'about' => "public/homes#about", as: "about"

  resources :addresses, only: [:create, :update, :destroy, :index, :edit]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete "cart_items/destroy_all" => "cart_items#destroy_all"

  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :index, :show, :create]
  post 'orders/confirm'
  get 'orders/thanks'

  get "customers/my_page" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get 'customers/unsubscribe'
  patch 'customers/withdraw'



  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    get '' => "homes#top"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
