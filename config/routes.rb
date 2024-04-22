Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"

  get 'about' => "public/homes#about", as: "about"
  get 'privacy' => "public/homes#privacy", as: "privacy"
  get 'law' => "public/homes#law", as: "law"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"

  get "search" => "public/searches#search"
  get "admin/search" => "admin/searches#search"


  scope module: :public do
    get "customers/my_page" => "customers#show", as: "customers_my_page"
    get "customers/information/edit" => "customers#edit"
    patch "customers/information" => "customers#update"
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    post 'orders/confirm'
    get 'orders/thanks'
    get 'genre/search' => 'searches#genre_search'
    resources :addresses, only: [:create, :update, :destroy, :index, :edit]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show, :create]

  end


  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update] do
      get "orders/customer_order" => "orders#customer_order", as: "customer_order"
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    get '' => "homes#top"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
