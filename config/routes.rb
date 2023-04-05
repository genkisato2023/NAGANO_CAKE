Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   #顧客用
   scope module: :public do
    delete 'cart_items/destroy_all'
    get 'cart_items/index'
    get '/about' => 'homes#about',as: 'about'
    post 'orders/confirm'
    get 'orders/complete'

    root to: "homes#top"
    resources :customers, only:[:show, :edit, :update]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :new, :update, :create, :destroy]
    resources :orders, only:[:index, :show, :new, :create]
   end



# 管理者用
  namespace :admin do

    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show]

  end


end