EcomShop::Application.routes.draw do
  
  get "order/cart"

  get "order/checkout"

  get "order/invoice"

  get "store/index"

  match "store/category/:id" => "store#category", as: :category
  match "store/search/" => "store#search", as: :search, via: :post

  get "store/view"

  get "home/index"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: "store#index"

end
